mobile_string = '07' + ('%09d' % rand(10 ** 9)).to_s

User.create!(title: "Mr", email: "test@gmail.com", password: "123123", first_name: "John", last_name: "Hartaway",
  citizenship: "UK", date_of_birth: Faker::Date.between(25.years.ago, 50.years.ago), phone_number: mobile_string,
  address_line_1: "14 Elder Street", address_line_2: "Shoreditch", city: "London",
  postcode: "E1 6BT", profile_picture_seed: "user.png")

# Guardians
Assignee.create!(relationship: "Friend", title: "Mrs", first_name: "Rebecca", last_name: "Jones",
  citizenship: "UK", date_of_birth: Faker::Date.between(25.years.ago, 50.years.ago), email: "rebecca@gmail.com", phone_number: mobile_string,
  address_line_1: "11 Test Road", address_line_2: "Test Cresent", city: "Testville",
  postcode: "T3 5TT", user_id: "1", profile_picture_seed: "user2.png", type: "Guardian")
Assignee.create!(relationship: "Cousin", title: "Mrs", first_name: "Betty", last_name: "Hall",
  citizenship: "UK", date_of_birth: Faker::Date.between(25.years.ago, 50.years.ago), email: "betty@gmail.com", phone_number: mobile_string,
  address_line_1: "11 Test Road", address_line_2: "Test Cresent", city: "Testville",
  postcode: "T3 5TT", user_id: "1", profile_picture_seed: "user2.png", type: "Guardian")

# Approvers
Assignee.create!(relationship: "Friend", title: "Mr", first_name: "George", last_name: "Martin",
  citizenship: "UK", date_of_birth: Faker::Date.between(25.years.ago, 50.years.ago), email: "george@gmail.com", phone_number: mobile_string,
  address_line_1: "11 Test Road", address_line_2: "Test Cresent", city: "Testville",
  postcode: "T3 5TT", user_id: "1", profile_picture_seed: "user.png", type: "Approver")
Assignee.create!(relationship: "Friend", title: "Mr", first_name: "William", last_name: "Rowley",
  citizenship: "UK", date_of_birth: Faker::Date.between(25.years.ago, 50.years.ago), email: "william@gmail.com", phone_number: mobile_string,
  address_line_1: "11 Test Road", address_line_2: "Test Cresent", city: "Testville",
  postcode: "T3 5TT", user_id: "1", profile_picture_seed: "user.png", type: "Approver")
Assignee.create!(relationship: "Friend", title: "Mrs", first_name: "Rachel", last_name: "Green",
  citizenship: "", date_of_birth: Faker::Date.between(25.years.ago, 50.years.ago), email: "rachel@gmail.com", phone_number: mobile_string,
  address_line_1: "11 Test Road", address_line_2: "Test Cresent", city: "Testville",
  postcode: "T3 5TT", user_id: "1", profile_picture_seed: "user2.png", type: "Approver")

# Partner
Assignee.create!(relationship: "Partner", title: "Mrs", first_name: "Edith", last_name: "Hartaway",
  citizenship: "UK", date_of_birth: Faker::Date.between(25.years.ago, 50.years.ago), email: "edith@gmail.com", phone_number: mobile_string,
  address_line_1: "11 Test Road", address_line_2: "Test Cresent", city: "Testville",
  postcode: "T3 5TT", user_id: "1", profile_picture_seed: "user2.png", type: "Recipient")

# Children
Assignee.create!(relationship: "Child", title: "Mrs", first_name: "Art", last_name: "Hartaway",
  citizenship: "UK", date_of_birth: Faker::Date.between(5.years.ago, 18.years.ago), email: "art@gmail.com", phone_number: mobile_string,
  address_line_1: "11 Test Road", address_line_2: "Test Cresent", city: "Testville",
  postcode: "T3 5TT", user_id: "1", profile_picture_seed: "user2.png", type: "Recipient")
Assignee.create!(relationship: "Child", title: "Mr", first_name: "Phillip", last_name: "Hartaway",
  citizenship: "UK", date_of_birth: Faker::Date.between(5.years.ago, 18.years.ago), email: "phillip@gmail.com", phone_number: mobile_string,
  address_line_1: "11 Test Road", address_line_2: "Test Cresent", city: "Testville",
  postcode: "T3 5TT", user_id: "1", profile_picture_seed: "user.png", type: "Recipient")

# Mother
Assignee.create!(relationship: "Mother", title: "Mrs", first_name: "Jane", last_name: "Hartaway",
  citizenship: "UK", date_of_birth: Faker::Date.between(50.years.ago, 70.years.ago), email: "jane@gmail.com", phone_number: mobile_string,
  address_line_1: "11 Test Road", address_line_2: "Test Cresent", city: "Testville",
  postcode: "T3 5TT", user_id: "1", profile_picture_seed: "user2.png", type: "Recipient")

# Friend
Assignee.create!(relationship: "Friend", title: "Mr", first_name: "Mike", last_name: "Lawson",
  citizenship: "UK", date_of_birth: Faker::Date.between(25.years.ago, 50.years.ago), email: "mike@gmail.com", phone_number: mobile_string,
  address_line_1: "11 Test Road", address_line_2: "Test Cresent", city: "Testville",
  postcode: "T3 5TT", user_id: "1", profile_picture_seed: "user.png", type: "Recipient")

# Notes
10.times do
  Note.create!(title: Faker::Book.title, content: Faker::Lorem.paragraph, assignee_id: rand(1..10).to_s, user_id: "1")
end

# Documents
5.times do
  Reference.create!(title: Faker::Commerce.department, comments: "Faker::Lorem.sentence", document_seed: "document_dwvexg.jpg",
    assignee_id: rand(1..10).to_s, user_id: "1")
end

# Photos
Photo.create!(title: Faker::Commerce.product_name, caption: Faker::Lorem.sentence, photo_seed: "girl_vlismu.jpg",
  assignee_id: rand(1..10).to_s, user_id: "1")
Photo.create!(title: Faker::Commerce.product_name, caption: Faker::Lorem.sentence, photo_seed: "lake_aska66.jpg",
  assignee_id: rand(1..10).to_s, user_id: "1")
Photo.create!(title: Faker::Commerce.product_name, caption: Faker::Lorem.sentence, photo_seed: "bike_vqsgzk.jpg",
  assignee_id: rand(1..10).to_s, user_id: "1")
