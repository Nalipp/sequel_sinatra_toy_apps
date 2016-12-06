class DataConnection
  DB = Sequel.connect("postgres://localhost/time_clock")

  def initialize(logger)
    DB.logger = logger
  end

  def find_all_study_entities
    DB[:study_entities].select { [study_entities__id.as('study_entity_id'),
       study_entities__title, categories__title.as('category'), types__title.as('type'),
       time_stamps__start_time, time_stamps__end_time, time_stamps__id.as('time_stamps_id')] }.
       join(:categories, id: :study_entities__id).
       join(:types, id: :study_entities__id).
       join(:time_stamps, study_entities_id: :id).order(:time_stamps__end_time).reverse
  end

  def calculate_time_entity_total(id)
    DB.fetch("SELECT sum(EXTRACT(EPOCH FROM (end_time - start_time)))
              FROM time_stamps
              WHERE study_entities_id = #{id};").first[:sum]
  end


  def start_time_stamp(entities_id)
    DB[:time_stamps].insert(study_entities_id: entities_id)
  end

  def end_time_stamp(time_stamp_id)
    DB.run("UPDATE time_stamps SET end_time = now() WHERE id = #{time_stamp_id};")
  end

  def find_category_id(category)
    if DB[:categories].select(:id).where(title: category).all.empty?
      DB[:categories].insert(title: category)
    else
      DB[:categories].select(:id).where(title: category).first[:id]
    end
  end

  def find_type_id(type)
    if DB[:types].select(:id).where(title: type).all.empty?
      DB[:types].insert(title: type)
    else
      DB[:types].select(:id).where(title: type).first[:id]
    end
  end

  def create_new_timestamp(study_entity_id)
    DB[:time_stamps].insert(study_entities_id: study_entity_id)
  end

  def create_new_time_entity(category, type, title)
    category_id = find_category_id(category)
    type_id = find_type_id(type)
    DB[:study_entities].insert(title: title, category_id: category_id, type_id: type_id)
    create_new_timestamp(DB[:study_entities].max(:id))
  end

  def delete_time_stamp(id)
    DB[:time_stamps].where(id: id).delete
  end
end
