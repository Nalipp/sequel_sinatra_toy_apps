require 'pry'

require 'sinatra'
require 'sinatra/reloader'
require 'tilt/erubis'
require 'sequel'

require_relative "data_connection"

configure do
  enable :sessions
  set :session_secret, 'secret'
  set :erb, :escape_html => true
  set :port, 1414
end

before do
  @storage = DataConnection.new(logger)
end

get '/' do
  erb :summary, layout: :layout
end

get '/all_money_subs/:sort_by' do
  if params[:sort_by] == "category"
    @all_money_subs = @storage.sort_by_category
  elsif params[:sort_by] == "amount"
    @all_money_subs = @storage.sort_by_amount
  elsif params[:sort_by] == "description"
    @all_money_subs = @storage.sort_by_description
  else
    @all_money_subs = @storage.sort_by_date
  end
  erb :money_subs, layout: :layout
end
