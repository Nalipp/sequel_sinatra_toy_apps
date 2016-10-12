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

  def all_categories
    DB[:categories].all
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

  def create_new_category(category_name)
    DB[:categories].insert(category_type: category_name)
  end

  def find_category_id(category_name)
    category = all_categories.select { |c| c[:category_type] == category_name }
    if category.empty?
      category_id = create_new_category(category_name)
    else
      category_id = category.first[:id]
    end
  end

  def new_sub(date, amount, category, description)
    category_id = find_category_id(category)
    DB[:money_subs].insert(date_sub: date, amount: amount.to_i, description: description, category_id: category_id)
  end

end
