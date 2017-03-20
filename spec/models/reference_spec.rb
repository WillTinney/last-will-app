require 'rails_helper'

describe Reference do

  it 'has a valid factory' do
    expect(FactoryGirl.build(:reference)).to be_valid
  end

  it "belongs to a user" do
    expect(Reference.reflect_on_association(:user).macro).to eql(:belongs_to)
  end

  context "a new reference" do
    subject { FactoryGirl.build(:reference, user: FactoryGirl.create(:user)) }

    it "has a title" do
      subject.title = nil
      expect(subject).not_to be_valid
    end

    it "has comments" do
      subject.comments = nil
      expect(subject).to be_valid
    end
  end
end
