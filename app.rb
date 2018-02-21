require("sinatra")
require("sinatra/reloader")
also_reload("lib/**/*.rb")
require("./lib/doctor")
require("./lib/patient")
require("pg")

DB = PG.connect({:dbname => "doc_office_test"})

get('/') do
  erb(:home)
end

get('/doctors/new') do
  erb(:doctor_form)
end

get('/doctors') do
  @doctors = Doctor.all()
  erb(:doctors)
end

post('/doctors') do
  name = params.fetch('name')
  speciality = params.fetch('speciality')
  doctor = Doctor.new({:name => name, :speciality => speciality, :id => nil})
  doctor.save()
  erb(:success)
end

get('/doctors/:id') do
  @doctor = Doctor.find(params.fetch("id").to_i)
  erb(:doctor)
end
