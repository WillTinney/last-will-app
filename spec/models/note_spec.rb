require 'rails_helper'

describe Note do

  it 'has a valid factory' do
    expect(FactoryGirl.build(:note)).to be_valid
  end

  it "belongs to a user" do
    expect(Note.reflect_on_association(:user).macro).to eql(:belongs_to)
  end

  context "a new note" do
    subject { FactoryGirl.build(:note, user: FactoryGirl.create(:user)) }

    it "has a title" do
      subject.title = nil
      expect(subject).not_to be_valid
    end

    it "has content" do
      subject.content = nil
      expect(subject).not_to be_valid
    end
  end
end
