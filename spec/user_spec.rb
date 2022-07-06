require 'rails_helper'

RSpec.describe User, type: :model do
  describe "Validations" do
    subject { described_class.new(first_name: "Patrick", last_name: "Star", email: "tests@test.com", password: "therock", password_confirmation: "therock") }
    user = described_class.new(first_name: "tests", last_name: "tests", email: "tests@test.com", password: "qwerty", password_confirmation: "qwerty")

    it "is valid with the valid attributes" do
      expect(subject).to be_valid
    end 

    it "is not valid without a first name" do
      subject.first_name = nil
      expect(subject).not_to be_valid
    end

    it "is not valid without last name" do
      subject.last_name = nil
      expect(subject).not_to be_valid
    end

    it "is not valid without a password" do
      subject.password = nil
      expect(subject).not_to be_valid
    end 

    it "is not valid without a password confirmation" do
      subject.password_confirmation = nil
      expect(subject).not_to be_valid
    end

    it "is not valid if the password and password confirmation are not the same" do
      subject.password_confirmation = "123456"
      expect(subject).not_to be_valid
    end

    it "is not valid if password is less than 5 characters" do
      subject.password = "123"
      expect(subject).not_to be_valid
    end

    it "is not valid without an email" do
      subject.email = nil
      expect(subject).not_to be_valid
    end

    it "must have a unique email and not be case sensititve" do
      subject.save
      expect(user).not_to be_valid
    end

    it "must have a unique email and not be case sensitive 1" do 
      subject.save
      user.email = "TESTS@TEST.com"
      expect(user).not_to be_valid
    end
  end

  describe ".authenticate_with_credentials" do
    subject { described_class.new(first_name: "Patrick", last_name: "Star", email: "tests@test.com", password: "therock", password_confirmation: "therock") }

    it "authenticates with whitespaces in the email" do
      subject.save
      expect(User.authenticate_with_credentials(" tests@test.com ", "therock")).not_to be_nil
    end

    it "authenticates even with mixed cases in the email" do
      subject.save
      expect(User.authenticate_with_credentials("TeSts@TEST.cOm", "therock")).not_to be_nil
    end
  end
end