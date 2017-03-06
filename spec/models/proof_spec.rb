require 'rails_helper'

describe Proof do

  it 'has a valid factory' do
    expect(FactoryGirl.build(:proof)).to be_valid
  end

  it "belongs to a user" do
    expect(Proof.reflect_on_association(:user).macro).to eql(:belongs_to)
  end

  context "a new proof" do
    subject { FactoryGirl.build(:proof, user: FactoryGirl.create(:user)) }

    it "has a document" do
      subject.document = nil
      expect(subject).not_to be_valid
    end

    it "has a title" do
      subject.title = nil
      expect(subject).not_to be_valid
    end

    it "has comments" do
      subject.comments = nil
      expect(subject).not_to be_valid
    end
  end
end
