require('sinatra')
require('sinatra/contrib/all')
require('pry-byebug')

require_relative('./models/student')
require_relative('./models/house')


# create new student (form)
get '/hogwarts/new' do
  @houses = House.all()
  erb( :new )
end

# edit student
get '/hogwarts/:id/edit' do
  @houses = House.all()
  @student = Student.find(params['id'].to_i)
  erb( :edit )
end

# show student
get '/hogwarts/:id' do
  @student = Student.find(params['id'])
  erb( :show )
end

# show all students
get '/hogwarts' do
  # get all the students
  @students = Student.all()
  # display relevant erb file
  erb( :index )
end

# create new student (create student)
post '/hogwarts/:id/delete' do
  student = Student.find(params['id'])
  student.delete()
  erb( :delete )
end

post '/hogwarts' do
  @student = Student.new(params)
  @student.save()
  erb( :create )
end
