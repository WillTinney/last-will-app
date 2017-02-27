require 'faker'

FactoryGirl.define do
  factory :note do |f|
    f.association :user
    f.user_id { FactoryGirl.build(:user).id }
    f.title { "document" }
    f.content { Faker::Lorem.word }
  end
end
