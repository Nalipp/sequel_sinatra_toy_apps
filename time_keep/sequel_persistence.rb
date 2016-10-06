require "sequel"

class SequelPersistence
  DB = Sequel.connect("postgres://localhost/keep_time")
  MONTHS = ['january', 'february', 'march', 'april', 'may', 'june', 'july',
                  'august', 'september', 'october', 'november', 'december']
  DB.disconnect

  def initialize(logger)
    DB.logger = logger
  end

  def current_study_types
    DB[:study_type].map { |line| line[:name] }
  end

  def current_language_types
    DB[:language].map { |line| line[:name] }
  end

  def insert_new(type, name)
    DB[type.to_sym].insert(name: name)
    DB[type.to_sym].select(:id).where(name: name).first[:id]
  end

  def find_language_id(language_name)
    if current_language_types.include?(language_name)
      DB[:language].select(:id).where(name: language_name).first[:id]
    else
      insert_new("language", language_name)
    end
  end

  def find_study_type_id(study_type_name)
    if current_study_types.include?(study_type_name)
      DB[:study_type].select(:id).where(name: study_type_name).first[:id]
    else
      insert_new("study_type", study_type_name)
    end
  end

  def create_new_time(language, study_type, title, time, date_sub)
    DB[:time].insert(duration: time, date_sub: date_sub, title: title,
                     language_id: find_language_id(language),
                     study_type_id: find_study_type_id(study_type))
  end

  def all_times
    DB.fetch("SELECT language.name AS language, study_type.name AS study_type, time.title, time.duration, time.date_sub AS date
             FROM time JOIN language ON language.id = time.language_id
             JOIN study_type ON study_type.id = time.study_type_id
             ORDER BY (date) DESC;")
  end

  def all_times_total
    DB.fetch("SELECT SUM(duration) / 60 total FROM time")
  end

  def yearly_total(year)
    DB.fetch("SELECT SUM(duration) / 60 total FROM time WHERE date_sub BETWEEN
             '#{year}-01-01' AND '#{year}-12-31';")
  end

  def leap_year?(year)
    (year % 400 == 0) || (year % 4 == 0 && year % 100 != 0)
  end

  def find_max_day(month, year)
    return 29 if month == 'february' && leap_year?(year)
    return 28 if month == 'february'
    return 30 if ['april', 'june', 'september', 'november'].include?(month)
    return 31
  end

  def sum_month_total(month, year)
    month_num = MONTHS.find_index(month) + 1
    day = find_max_day(month, year)
    DB.fetch("SELECT SUM(duration) / 60 total FROM time WHERE date_sub BETWEEN
             '#{year}-#{month_num}-01' AND '#{year}-#{month_num}-#{day}';")
  end

  def sum_each_month_total(year)
    each_month = Hash.new
    MONTHS.each do |month|
      next if sum_month_total(month, year)[:total][:total].nil?
      each_month[month.to_sym] = sum_month_total(month, year)[:total]
    end
    each_month
  end

  def first_time_sub
    DB.fetch("SELECT date_sub FROM time ORDER BY date_sub")
  end

  def most_recent_time_sub
    DB.fetch("SELECT date_sub FROM time ORDER BY date_sub DESC")
  end

  def monthly_average(year)
    yearly_total(year).first[:total] / sum_each_month_total(year).count
  end

  def all_years_in_database
    min = first_time_sub.first[:date_sub].to_s[2..3]
    max = most_recent_time_sub.first[:date_sub].to_s[2..3]
    (min..max).to_a.map { |year| ("20" + year).to_i }
  end

  def weekly_average(year) #4.33 is the number of weeks in a month
    (monthly_average(year) / 4.33).round(1)
  end

  def all_language_totals
    DB.fetch("SELECT language.name, SUM(time.duration) / 60 total FROM language
              JOIN time ON time.language_id=language.id
              GROUP BY language.name
              ORDER BY total DESC
              LIMIT(10);")
  end

  def return_by_langauge(name)
    DB.fetch("SELECT title, SUM(duration) / 60 time FROM time WHERE language_id = 1
              GROUP BY (title)
              ORDER BY (time) DESC;")
  end

end
