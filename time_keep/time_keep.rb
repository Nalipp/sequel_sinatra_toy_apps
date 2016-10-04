require 'pry'

require "sinatra"
require "sinatra/content_for"
require "tilt/erubis"

require_relative "sequel_persistence"

configure do
  enable :sessions
  set :session_secret, "secret"
  set :erb, escape_html: true
  set :port, 9898
end

configure(:development) do
  require "sinatra/reloader"
  also_reload "sequel_persistence.rb"
end

before do
  @storage = SequelPersistence.new(logger)
end

get "/" do
  redirect "/times"
end

# View list of times
get "/times" do
  erb :times, layout: :layout
end

# Render a new time form
get "/times/new" do
  erb :new_time, layout: :layout
end

def length_validation
  params.values.each do |value|
    unless (1..100).cover?(value.length)
      session[:error] = "Values must be between 1 and 100 characters"
    end
  end
end

def date_validation
  date = params[:date].split('-')
  if !(1900..2100).cover?(date[0].to_i)
    return session[:error] = "Please use valid year format"
  elsif !(1..31).cover?(date[1].to_i)
    return session[:error] = "Please use valid day format"
  elsif !(1..12).cover?(date[2].to_i)
    return session[:error] = "Please use valid month format"
  end
end

# Submit a new time
post "/times" do
  length_validation
  date_validation

  if session[:error]
    @time = params
    erb :times, layout: :layout
  end

  @storage.create_new_time(params[:language], params[:study_type],
                           params[:title], params[:time], params[:date] )
  redirect "/times"
end
