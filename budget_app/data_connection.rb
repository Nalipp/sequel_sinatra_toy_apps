class DataConnection
  DB = Sequel.connect("postgres://localhost/budgets")

  def initialize(logger)
    DB.logger = logger
  end

  def all_money_subs
    DB[:money_subs].select { [money_subs__id, money_subs__date_sub, money_subs__amount,
                    money_subs__description, categories__category_type] }.
                    join(:categories, id: :money_subs__category_id)
  end

  def convert_to_category_name(id)
    DB[:categories].select(:category_type).where(id: id).first[:category_type]
  end

  def sort_by_category
    all_money_subs.order(:category_type)
  end

  def sort_by_amount
    all_money_subs.order(:amount)
  end

  def sort_by_date
    all_money_subs.order(:date_sub)
  end

  def sort_by_description
    all_money_subs.order(:description)
  end
end
