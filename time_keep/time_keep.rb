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

def length_validation_error(*inputs)
  inputs.each do |value|
    if !(1..50).cover?(value.length)
      return "Values must be between 1 and 50 characters"
    end
  end
  false
end

def date_validation_error #YYYY-MM-DD
  date_sub = params[:date_sub].split('-')
  if !(1900..2100).cover?(date_sub[0].to_i)
    return "Please use valid year format"
  elsif !(1..12).cover?(date_sub[1].to_i)
    return "Please use valid month format"
  elsif !(1..31).cover?(date_sub[2].to_i)
    return "Please use valid day format"
  end
end

def must_be_integer_error(time)
  return "time must be a positive number" if time.to_i == 0
  false
end

get "/" do
  redirect "/times_summary"
end

def load_time(id)
  time = @storage.find_time(id)
  return time if time

  session[:error] = "Time submission no longer available"
  redirect "/times"
  halt
end

def downcase_values(*inputs)
  inputs.each { |word| word.downcase! }
end

# View summary of all times
# Form to submit a new time
get "/times_summary" do
  erb :times_summary, layout: :layout
end

# View list of times
get "/times" do
  @storage.all_times


  erb :times, layout: :layout
end

# Submit a new time
post "/times" do
  @language = params[:language]
  @study_type = params[:study_type]
  @title = params[:title]
  @duration = params[:duration]
  @date_sub = params[:date_sub]

  downcase_values(@language, @study_type, @title)
  length_error = length_validation_error(@language, @study_type, @duration, @title, @date_sub)

  if length_error
    session[:error] = length_error
    erb :times, layout: :layout
  elsif date_validation_error
    session[:error] = date_validation_error
    erb :times, layout: :layout
  elsif must_be_integer_error(@duration)
    session[:error] = must_be_integer_error(@duration)
    erb :times, layout: :layout
  else
    @storage.create_new_time(@language, @study_type, @title, @duration, @date_sub)
    session[:success] = "time has been created"
    redirect "/times"
  end
end


# View time submission
get "/times/:time_id" do
  @time = load_time(params[:time_id])
  erb :time, layout: :layout
end

# Edit form for time submission
get "/times/:time_id/edit_time" do
  retrieved_time = load_time(params[:time_id]).first
  @time_id = retrieved_time[:time_id]

  @language = retrieved_time[:language]
  @study_type = retrieved_time[:study_type]
  @title = retrieved_time[:title]
  @duration = retrieved_time[:duration]
  @date_sub = retrieved_time[:date_sub]

  erb :edit_time, layout: :layout
end

# Submit an edited time
post "/times/:time_id" do
  @language = params[:language]
  @study_type = params[:study_type]
  @title = params[:title]
  @duration = params[:duration]
  @date_sub = params[:date_sub]

  downcase_values(@language, @study_type, @title)
  length_error = length_validation_error(@language, @study_type, @duration, @title, @date_sub)
  date_format_error = date_validation_error

  if length_error
    session[:error] = length_error
    erb :edit_time, layout: :layout
  elsif date_format_error
    session[:error] = date_format_error
    erb :edit_time, layout: :layout
  elsif must_be_integer_error(@duration)
    session[:error] = must_be_integer_error(@duration)
    erb :edit_time, layout: :layout
  else
    @storage.update_langauge_name(params[:time_id], @language)
    @storage.update_study_type(params[:time_id], @study_type)
    @storage.update_title(params[:time_id], @title)
    @storage.update_time(params[:time_id], @duration)
    @storage.update_date(params[:time_id], @date_sub)

    session[:success] = "Time subbmision has been updated"
    redirect "/times"
  end
end

# Delete a time
post "/times/:time_id/delete" do
  @storage.delete_time(params[:time_id])
    session[:success] = "The list has been deleted."
  if env["HTTP_X_REQUESTED_WITH"] == "XMLHttpRequest"
    "/times"
  else
    redirect "/times"
  end
end
