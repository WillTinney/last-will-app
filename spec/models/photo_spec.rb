require 'rails_helper'

describe Photo do

  it 'has a valid factory' do
    expect(FactoryGirl.build(:photo)).to be_valid
  end

  it "belongs to a user" do
    expect(Photo.reflect_on_association(:user).macro).to eql(:belongs_to)
  end

  context "a new photo" do
    subject { FactoryGirl.build(:photo, user: FactoryGirl.create(:user)) }

    it "has a title" do
      subject.title = nil
      expect(subject).not_to be_valid
    end

    it "has caption" do
      subject.caption = nil
      expect(subject).to be_valid
    end
  end
end
