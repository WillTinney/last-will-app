require 'faker'

FactoryGirl.define do
  factory :reference do |f|
    f.association :user
    f.user_id { FactoryGirl.build(:user).id }
    # f.document { "document.jpg" }
    f.title { "Test Reference" }
    f.comments { Faker::Lorem.word }
  end
end
