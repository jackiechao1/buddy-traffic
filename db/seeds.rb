# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Buddy.destroy_all
Booking.destroy_all

a = Buddy.create(name: 'robert', location: 'montreal', age: 35, sex: 'female', description: 'Weird name for a woman', start_available_time: Date.new , end_available_time: Date.new, user_id: 1)

b = Buddy.create(name: 'pop', location: 'montreal', age: 35, sex: 'female', description: 'Weird name for a woman', start_available_time: Date.new , end_available_time: Date.new, user_id: 1)
c = Booking.create(start_date: Date.new, end_date: Date.new, status: 'done', buddy_id: a.id, user_id: 1)
c = Booking.create(start_date: Date.new, end_date: Date.new, status: 'done', buddy_id: b.id, user_id: 1)

