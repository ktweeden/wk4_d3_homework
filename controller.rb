require 'sinatra'
require 'sinatra/contrib/all'
require_relative './models/house'
require_relative './models/student'


get '/' do
  erb(:splash)
end

get '/students' do
  @students = Student.find_all
  erb(:index)
end

get '/house/:id' do
  @house = House.find_by_id(params['id'])
  @students = @house.students
  erb(:house)
end

get '/student/new' do
  @houses = House.find_all
  erb(:new)
end

post '/students' do
  student = Student.new(params)
  student.save
  redirect '/students'
end
