# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create({username: "Bob", password: "Imawinner", password_confirmation: "Imawinner", city: "New York", state: "NY", phone: "555-555-5555", first_name: "Bob", last_name: "Burgerski", email: "bob@burger.com"})
