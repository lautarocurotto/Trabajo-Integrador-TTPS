# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
laplata = Location.create(name: 'LA PLATA' , province: 'BUENOS AIRES')
schedule_params = {monday_start: '2000-01-01 08:00:00', monday_end:'2000-01-01 15:00:00', tuesday_start:'2000-01-01 08:00:00', tuesday_end:'2000-01-01 15:00:00', wednesday_start:'2000-01-01 08:00:00', wednesday_end:'2000-01-01 15:00:00', thursday_start:'2000-01-01 08:00:00', thursday_end:'2000-01-01 15:00:00',friday_start:'2000-01-01 08:00:00',friday_end:'2000-01-01 15:00:00', saturday_start:'2000-01-01 08:00:00',saturday_end:'2000-01-01 15:00:00', sunday_start:'2000-01-01 00:00:00', sunday_end: '2000-01-01 08:00:00'}
horario = Schedule.create(schedule_params)
branch = Branch.create(name: 'Sucursal Calle 7', address: '7 n° 900' , phone: 4502000 , location_id: laplata.id  , schedule_id: horario.id)
user = User.create! :email => 'admin@admin.com', :password => 'administrador', :password_confirmation => 'administrador', :role => 'admin'
personal = User.create(email: 'personal@personal.com', password: 'personalbancario', password_confirmation: 'personalbancario' , role: 'staff',branches_id: branch.id)
