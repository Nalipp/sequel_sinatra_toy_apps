class DataConnection
  DB = Sequel.connect("postgres://localhost/budgets")

  def initialize(logger)
    DB.logger = logger
  end
end
