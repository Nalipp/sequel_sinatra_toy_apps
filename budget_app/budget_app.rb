require 'pry'

require 'sinatra'
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

configure(:development) do
  require "sinatra/reloader"
  also_reload "data_connection.rb"
end

def validate_date_error(date)
  split = date.split('-')
  if !(1900..2200).cover?(split[0].to_i) || !(1..12).cover?(split[1].to_i) ||
     !(1..28).cover?(split[2].to_i)
    return "Please use correct date format"
  end
  false
end

def validate_text_error(*params)
  params.each do |param|
    if !(1..50).cover?(param.length)
      return "Inputs must be between 1 and 50 characters"
    end
  end
  false
end

def validate_number_error(amount)
  if !(1..999999).cover?(amount.to_i)
    return "amount must be between 1 and 1 million"
  end
  false
end

get '/' do
  erb :summary, layout: :layout
end

# List of all submissions and create new submission form
get '/money_subs/:sort_by' do
  if params[:sort_by] == "category"
    @all_money_subs = @storage.sort_by_category
  elsif params[:sort_by] == "amount"
    @all_money_subs = @storage.sort_by_amount
  elsif params[:sort_by] == "description"
    @all_money_subs = @storage.sort_by_description
  else
    @all_money_subs = @storage.sort_by_date.reverse
  end

  erb :money_subs, layout: :layout
end

# Submit new money submission to database
post '/new_sub' do
  @all_money_subs = @storage.sort_by_date.reverse

  @date = params[:date]
  @amount = params[:amount]
  @category = params[:category]
  @description = params[:description]

  if error = validate_date_error(params[:date])
    session[:error] = error
    erb :money_subs, layout: :layout
  elsif error = validate_text_error(params[:category], params[:description])
    session[:error] = error
    erb :money_subs, layout: :layout
  elsif error = validate_number_error(params[:amount])
    session[:error] = error
    erb :money_subs, layout: :layout
  else
    @storage.new_sub(@date, @amount, @category, @description)
    session[:success] = "money input has been processed"
    redirect "/money_subs/date"
  end
end

# Delete money submission
post '/money_subs/:id/delete' do
  @storage.delete_money_sub(params[:id])
  session[:success] = "money input has been deleted"
  redirect "/money_subs/date"
end

# Retreive edit money submission from
get '/money_subs/:id/edit' do
  @money_sub = @storage.find_money_sub(params[:id]).first
  @category_name = @storage.find_category_name(@money_sub[:category_id])
  erb :edit_money_sub, layout: :layout
end

# Update a money submission
post '/money_subs/:id/edit' do
  @money_sub = @storage.find_money_sub(params[:id]).first
  @category_name = @storage.find_category_name(@money_sub[:category_id])

  if error = validate_date_error(params[:date])
    session[:error] = error
    erb :edit_money_sub, layout: :layout
  elsif error = validate_text_error(params[:category], params[:description])
    session[:error] = error
    erb :edit_money_sub, layout: :layout
  elsif error = validate_number_error(params[:amount])
    session[:error] = error
    erb :edit_money_sub, layout: :layout
  else
    @storage.update_sub(params[:id], params[:date], params[:amount], params[:category], params[:description])
    session[:success] = "money input has been updated"
    redirect "/money_subs/date"
  end
end
