require 'rails_helper'

describe Video do

  it 'has a valid factory' do
    expect(FactoryGirl.build(:video)).to be_valid
  end

  it "belongs to a user" do
    expect(Video.reflect_on_association(:user).macro).to eql(:belongs_to)
  end

  context "a new video" do
    subject { FactoryGirl.build(:video, user: FactoryGirl.create(:user)) }

    it "has a title" do
      subject.title = nil
      expect(subject).not_to be_valid
    end

    it "has description" do
      subject.description = nil
      expect(subject).to be_valid
    end
  end
end
