# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
mobile_string = '07' + ('%09d' % rand(10 ** 9)).to_s

User.create!(title: "Mr", email: "test@gmail.com", password: "123123", first_name: "John", last_name: "Hartaway",
  citizenship: "UK", date_of_birth: Faker::Date.between(25.years.ago, 50.years.ago), phone_number: mobile_string,
  address_line_1: "14 Elder Street", address_line_2: "Shoreditch", city: "London",
  postcode: "E1 6BT", country: "UK")

# Guardians
Assignee.create!(title: "Mrs", relationship: "Friend", first_name: "Rebecca", last_name: "Jones",
  citizenship: "UK", date_of_birth: Faker::Date.between(25.years.ago, 50.years.ago), email: "rebecca@gmail.com", phone_number: mobile_string,
  address_line_1: "11 Test Road", address_line_2: "Test Cresent", city: "Testville",
  postcode: "T3 5TT", user_id: "1", type: "Guardian", country: "UK")
Assignee.create!(title: "Mrs", relationship: "Cousin", first_name: "Betty", last_name: "Hall",
  citizenship: "UK", date_of_birth: Faker::Date.between(25.years.ago, 50.years.ago), email: "betty@gmail.com", phone_number: mobile_string,
  address_line_1: "11 Test Road", address_line_2: "Test Cresent", city: "Testville",
  postcode: "T3 5TT", country: "UK", user_id: "1", type: "Guardian")

# Partner
Assignee.create!(title: "Mrs", relationship: "Partner", first_name: "Edith", last_name: "Hartaway",
  citizenship: "UK", date_of_birth: Faker::Date.between(25.years.ago, 50.years.ago), email: "edith@gmail.com", phone_number: mobile_string,
  address_line_1: "11 Test Road", address_line_2: "Test Cresent", city: "Testville",
  postcode: "T3 5TT", country: "UK", user_id: "1", type: "Recipient")

# Children
Assignee.create!(title: "Mrs", relationship: "Child", first_name: "Art", last_name: "Hartaway",
  citizenship: "UK", date_of_birth: Faker::Date.between(5.years.ago, 18.years.ago), email: "art@gmail.com", phone_number: mobile_string,
  address_line_1: "11 Test Road", address_line_2: "Test Cresent", city: "Testville",
  postcode: "T3 5TT", country: "FR", user_id: "1", type: "Recipient")
Assignee.create!(title: "Mr", relationship: "Child", first_name: "Phillip", last_name: "Hartaway",
  citizenship: "UK", date_of_birth: Faker::Date.between(5.years.ago, 18.years.ago), email: "phillip@gmail.com", phone_number: mobile_string,
  address_line_1: "11 Test Road", address_line_2: "Test Cresent", city: "Testville",
  postcode: "T3 5TT", user_id: "1", type: "Recipient")

# Mother
Assignee.create!(title: "Mrs", relationship: "Mother", first_name: "Jane", last_name: "Hartaway",
  citizenship: "UK", date_of_birth: Faker::Date.between(50.years.ago, 70.years.ago), email: "jane@gmail.com", phone_number: mobile_string,
  address_line_1: "11 Test Road", address_line_2: "Test Cresent", city: "Testville",
  postcode: "T3 5TT", user_id: "1", type: "Recipient", country: "UK")

# Friend
Assignee.create!(title: "Mr", relationship: "Friend", first_name: "Mike", last_name: "Lawson",
  citizenship: "UK", date_of_birth: Faker::Date.between(25.years.ago, 50.years.ago), email: "mike@gmail.com", phone_number: mobile_string,
  address_line_1: "11 Test Road", address_line_2: "Test Cresent", city: "Testville",
  postcode: "T3 5TT", user_id: "1", type: "Recipient", country: "UK")

# Notes
10.times do
  Note.create!(title: Faker::Book.title, content: Faker::Lorem.paragraph, user_id: "1")
end
