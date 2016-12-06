require 'pry'

require 'sinatra'
require 'tilt/erubis'
require 'sequel'

require_relative "data_connection"

configure do
  enable :sessions
  set :session_secret, 'secret'
  set :erb, :escape_html => true
  set :port, 1515
end

before do
  @storage = DataConnection.new(logger)
end

configure(:development) do
  require "sinatra/reloader"
  also_reload "data_connection.rb"
end

get '/' do
  redirect '/all_times/summary'
end

# Summary of all time
get '/all_times/summary' do
  binding.pry
  # @total_time = @storage.calculate_time_entity_total(@id)
end

# Return list of all study_entities
get '/all_times' do
  @all_study_entities = @storage.find_all_study_entities
  erb :new_time, layout: :layout
end

# Post new time entitiy
post '/new_time' do

  # @category = prams[:category]
  # @type = prams[:type]
  # @name = prams[:name]

  @storage.create_new_time_entity(params[:category], params[:type], params[:title])

  session[:success] = "time has been created"
  redirect '/all_times'
end

# Post a start time to a referencing a study_entitiy
post '/all_times/:study_entity_id/start_time_stamp' do
  @all_study_entities = @storage.find_all_study_entities

  @storage.start_time_stamp(params[:study_entity_id])
  session[:success] = "New time stamp has begun"
  redirect'/all_times'
end

# Post an end time to a referencing a study_entitiy
post '/all_times/:time_stamps_id/end_time_stamp' do
  @all_study_entities = @storage.find_all_study_entities

  @storage.end_time_stamp(params[:time_stamps_id])
  session[:success] = "Time stamp has ended"
  redirect'/all_times'
end

# Delete a timestamp
post '/all_times/:time_stamps_id/delete' do
  @storage.delete_time_stamp(params[:time_stamps_id])
  session[:success] = "Timestamp has been deleted"
  redirect '/all_times'
end
