require 'faker'

FactoryGirl.define do
  factory :note do |f|
    f.association :user
    f.user_id { FactoryGirl.build(:user).id }
    f.title { "Test Note" }
    f.content { Faker::Lorem.word }
  end
end
