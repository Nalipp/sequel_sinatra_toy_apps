require "sequel"

class SequelPersistence
  DB = Sequel.connect("postgres://localhost/keep_time")
  MONTHS = ['january', 'february', 'march', 'april', 'may', 'june', 'july',
                  'august', 'september', 'october', 'november', 'december']

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
             JOIN study_type ON study_type.id = time.study_type_id;")
  end

  def sum_month_total(month, year)
    month_num = MONTHS.find_index(month) + 1
    DB.fetch("SELECT SUM(duration) / 60 total FROM time WHERE date_sub BETWEEN
             '#{year}-#{month_num}-01' AND '#{year}-#{month_num}-29';")
  end

  def sum_each_month_total(year)
    each_month = Hash.new
    MONTHS.each do |month|
      each_month[month.to_sym] = sum_month_total(month, year)
    end
    each_month
  end
end
