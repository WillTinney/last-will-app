require 'faker'
require 'nationality'

relationship_array = [ 'Friend', 'Family' ]

FactoryGirl.define do
  factory :assignee do |f|
    f.association :user
    f.title { ['Mr', 'Mrs', 'Ms'].sample }
    f.first_name { Faker::Name.first_name }
    f.last_name { Faker::Name.last_name }
    f.citizenship { Nationality::NATIONALITY[rand(0..160)] }
    f.email { Faker::Internet.free_email }
    f.phone_number { '07' + ('%09d' % rand(10 ** 9)).to_s }
    f.address_line_1 { Faker::Address.street_address }
    f.address_line_2 { Faker::Address.secondary_address }
    f.city { Faker::Address.city }
    f.country { Faker::Address.country_code }
    f.postcode { Faker::Address.postcode }

    trait :guardian do
      type { 'Guardian' }
      relationship { relationship_array[rand(0..1)] }
      date_of_birth { Faker::Date.between(25.years.ago, 50.years.ago) }
    end

    trait :child do
      type { 'Recipient' }
      relationship { 'Child' }
      date_of_birth { Faker::Date.between(1.years.ago, 20.years.ago) }
    end

    trait :partner do
      type { 'Recipient' }
      relationship { 'Partner' }
      date_of_birth { Faker::Date.between(25.years.ago, 50.years.ago) }
    end
  end
end
