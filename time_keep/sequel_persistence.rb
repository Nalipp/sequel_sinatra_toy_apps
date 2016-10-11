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

  def find_language_id(language)
    if current_language_types.include?(language)
      DB[:language].select(:id).where(name: language).first[:id]
    else
      insert_new("language", language)
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
    DB[:time].select { [time__id, language__name.as('language'), study_type__name.as('study_type'),
              time__title, time__duration, time__date_sub] }.
              join(:language, id: :time__language_id).
              join(:study_type, id: :time__study_type_id).order(:date_sub).reverse
  end

  def find_time(id)
    DB[:time].select { [time__id, language__name.as('language'), study_type__name.as('study_type'),
              time__title, time__duration, time__date_sub] }.
              join(:language, id: :time__language_id).
              join(:study_type, id: :time__study_type_id).where(time__id: "#{id}").
              order(:date_sub).reverse.all
  end

  def all_times_total
    DB[:time].sum(:duration) / 60
  end

  def yearly_total(year)
    DB[:time].where(date_sub: ("#{year}-01-01")..("#{year}-12-31")).sum(:duration) / 60
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
    DB[:time].where(date_sub: ("#{year}-#{month_num}-01")..("#{year}-#{month_num}-#{day}")).
                               sum(:duration).to_i / 60
  end

  def sum_each_month_total(year)
    each_month = Hash.new
    MONTHS.each do |month|
      next if sum_month_total(month, year) == 0
      each_month[month.to_sym] = sum_month_total(month, year)
    end
    each_month
  end

  def first_time_sub
    DB[:time].select(:date_sub).order(:date_sub)
  end

  def most_recent_time_sub
    DB[:time].select(:date_sub).order(:date_sub).reverse
  end

  def monthly_average(year)
    yearly_total(year) / sum_each_month_total(year).count
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

  def update_langauge_name(time_id, new_name)
    new_id = find_language_id(new_name)
    DB[:time].where(:id => time_id).update(:language_id => new_id)
  end

  def update_study_type(time_id, new_study_type)
    new_id = find_study_type_id(new_study_type)
    DB[:time].where(:id => time_id).update(:study_type_id => new_id)
  end

  def update_title(time_id, new_title)
    DB[:time].where(:id => time_id).update(:title => new_title)
  end

  def update_time(time_id, new_duration)
    DB[:time].where(:id => time_id).update(:duration => new_duration)
  end

  def update_date(time_id, new_date_sub)
    DB[:time].where(:id => time_id).update(:date_sub => new_date_sub)
  end

  def delete_time(time_id)
    DB[:time].where(:id => time_id).delete
  end
end
