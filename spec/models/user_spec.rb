require 'rails_helper'

describe User do

  it "has a valid factory" do
    expect(FactoryGirl.build(:user)).to be_valid
  end

  context "a new user" do
    subject { FactoryGirl.build(:user) }


    it "is invalid without an email" do
      subject.email = nil
      expect(subject).to_not be_valid
    end

    it "is invalid without a password" do
      subject.password = nil
      expect(subject).to_not be_valid
    end

    it "is invalid without a title" do
      subject.title = nil
      expect(subject).to_not be_valid
    end

    it "is invalid without a first name" do
      subject.first_name = nil
      expect(subject).to_not be_valid
    end

    it "is invalid without a last name" do
      subject.last_name = nil
      expect(subject).to_not be_valid
    end

    it "is valid without an address" do
      subject.address_line_1 = nil
      expect(subject).to be_valid
    end

    # Need to google how to check email with ActionMailer confirmation
    it "has a unique email" do
      user1 = subject
      user1.save
      user2 = subject.dup
      expect(user2).to_not be_valid
    end
  end

  it "has many guardians" do
    expect(User.reflect_on_association(:guardians).macro).to eql(:has_many)
  end

  it "has many recipients" do
    expect(User.reflect_on_association(:recipients).macro).to eql(:has_many)
  end

  it "has many proofs" do
    expect(User.reflect_on_association(:proofs).macro).to eql(:has_many)
  end

  it "has many notes" do
    expect(User.reflect_on_association(:notes).macro).to eql(:has_many)
  end

  describe '#full_name ' do
    it "returns a user's full name" do
      subject.first_name = 'John'
      subject.last_name = 'Smith'
      expect(subject.full_name).to eql("John Smith")
    end
  end
end
