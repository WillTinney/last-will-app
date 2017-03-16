require 'faker'

FactoryGirl.define do
  factory :photo do |f|
    f.association :user
    f.user_id { FactoryGirl.build(:user).id }
    # f.photo { "banner1.jpg" }
    f.title { "Test Photo" }
    f.caption { Faker::Lorem.word }
  end
end
