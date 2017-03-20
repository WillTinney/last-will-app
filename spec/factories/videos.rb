require 'faker'

FactoryGirl.define do
  factory :video do |f|
    f.association :user
    f.user_id { FactoryGirl.build(:user).id }
    # f.photo { "banner1.jpg" }
    f.title { "Test Video" }
    f.description { Faker::Lorem.word }
  end
end
