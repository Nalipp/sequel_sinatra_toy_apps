require "sequel"

class SequelPersistence
  DB = Sequel.connect("postgres://localhost/keep_time")

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
end
