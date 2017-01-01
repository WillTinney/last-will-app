# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
mobile_string = '07' + ('%09d' % rand(10 ** 9)).to_s

User.create!(email: "test@gmail.com", password: "123123", first_name: "John", last_name: "Hartaway",
  citizenship: "UK", date_of_birth: Faker::Date.between(25.years.ago, 50.years.ago), phone_number: "mobile_string",
  address_line_1: "14 Elder Street", address_line_2: "Shoreditch", town: "London",
  postcode: "E1 6BT")

# Guardians
Guardian.create!(relationship: "Friend", first_name: "Rebecca", last_name: "Jones",
  citizenship: "UK", date_of_birth: Faker::Date.between(25.years.ago, 50.years.ago), email: "rebecca@gmail.com", phone_number: mobile_string,
  address_line_1: "11 Test Road", address_line_2: "Test Cresent", town: "Testville",
  postcode: "T3 5TT")
Guardian.create!(relationship: "Cousin", first_name: "Betty", last_name: "Hall",
  citizenship: "UK", date_of_birth: Faker::Date.between(25.years.ago, 50.years.ago), email: "betty@gmail.com", phone_number: mobile_string,
  address_line_1: "11 Test Road", address_line_2: "Test Cresent", town: "Testville",
  postcode: "T3 5TT")

# Approvers
Approver.create!(relationship: "Friend", first_name: "George", last_name: "Martin",
  citizenship: "UK", date_of_birth: Faker::Date.between(25.years.ago, 50.years.ago), email: "george@gmail.com", phone_number: mobile_string,
  address_line_1: "11 Test Road", address_line_2: "Test Cresent", town: "Testville",
  postcode: "T3 5TT")
Approver.create!(relationship: "Friend", first_name: "William", last_name: "Rowley",
  citizenship: "UK", date_of_birth: Faker::Date.between(25.years.ago, 50.years.ago), email: "william@gmail.com", phone_number: mobile_string,
  address_line_1: "11 Test Road", address_line_2: "Test Cresent", town: "Testville",
  postcode: "T3 5TT")
Approver.create!(relationship: "Friend", first_name: "Rachel", last_name: "Green",
  citizenship: "", date_of_birth: Faker::Date.between(25.years.ago, 50.years.ago), email: "rachel@gmail.com", phone_number: mobile_string,
  address_line_1: "11 Test Road", address_line_2: "Test Cresent", town: "Testville",
  postcode: "T3 5TT")

# Partner
Recipient.create!(relationship: "Partner", first_name: "Edith", last_name: "Hartaway",
  citizenship: "UK", date_of_birth: Faker::Date.between(25.years.ago, 50.years.ago), email: "edith@gmail.com", phone_number: mobile_string,
  address_line_1: "11 Test Road", address_line_2: "Test Cresent", town: "Testville",
  postcode: "T3 5TT")

# Children
Recipient.create!(relationship: "Child", first_name: "Art", last_name: "Hartaway",
  citizenship: "UK", date_of_birth: Faker::Date.between(5.years.ago, 18.years.ago), email: "art@gmail.com", phone_number: mobile_string,
  address_line_1: "11 Test Road", address_line_2: "Test Cresent", town: "Testville",
  postcode: "T3 5TT")
Recipient.create!(relationship: "Child", first_name: "Phillip", last_name: "Hartaway",
  citizenship: "UK", date_of_birth: Faker::Date.between(5.years.ago, 18.years.ago), email: "phillip@gmail.com", phone_number: mobile_string,
  address_line_1: "11 Test Road", address_line_2: "Test Cresent", town: "Testville",
  postcode: "T3 5TT")

# Mother
Recipient.create!(relationship: "Mother", first_name: "Jane", last_name: "Hartaway",
  citizenship: "UK", date_of_birth: Faker::Date.between(50.years.ago, 70.years.ago), email: "jane@gmail.com", phone_number: mobile_string,
  address_line_1: "11 Test Road", address_line_2: "Test Cresent", town: "Testville",
  postcode: "T3 5TT")

# Friend
Recipient.create!(relationship: "Friend", first_name: "Mike", last_name: "Lawson",
  citizenship: "UK", date_of_birth: Faker::Date.between(25.years.ago, 50.years.ago), email: "mike@gmail.com", phone_number: mobile_string,
  address_line_1: "11 Test Road", address_line_2: "Test Cresent", town: "Testville",
  postcode: "T3 5TT")
