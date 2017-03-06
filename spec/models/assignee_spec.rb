require 'rails_helper'

describe Assignee do

  it "has a valid factory" do
    expect(FactoryGirl.build(:assignee)).to be_valid
  end

  it "belongs to a user" do
    expect(Assignee.reflect_on_association(:user).macro).to eql(:belongs_to)
  end

  context "a new assignee" do
    subject { FactoryGirl.build(:assignee, user: FactoryGirl.create(:user)) }

    it "is invalid without a first name" do
      subject.first_name = nil
      expect(subject).to_not be_valid
    end

    it "is invalid without a last name" do
      subject.last_name = nil
      expect(subject).to_not be_valid
    end
  end

  describe '#full_name ' do
    it "returns an assignees's full name" do
      subject.first_name = 'John'
      subject.last_name = 'Smith'
      expect(subject.full_name).to eql("John Smith")
    end
  end
end
