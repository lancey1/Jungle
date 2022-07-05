require 'rails_helper'

RSpec.describe Product, type: :model do
  describe "Validations" do
    let(:category) { Category.new(name: "Evergreen") }

    subject {described_class.new(name: "Pine", price_cents: 1000, quantity: 25, category: category) }

    it "is valid with all valid attributes" do
      expect(subject).to be_valid
      subject.save
      expect(subject.errors.full_messages).to eql([])
    end

    it "is not valid without a name" do
      subject.name = nil 
      expect(subject).not_to be_valid
      subject.save
      expect(subject.errors.full_messages).to eql(["Name can't be blank"])
    end

    it "is not valid without a price" do
      subject.price_cents = nil
      expect(subject).not_to be_valid
      subject.save
      expect(subject.errors.full_messages).to eql(["Price cents is not a number", "Price is not a number", "Price can't be blank"])
    end

    it "is not valid without a quantity" do
      subject.quantity = nil
      expect(subject).not_to be_valid
      subject.save
      expect(subject.errors.full_messages).to eql(["Quantity can't be blank"])
    end

    it "is not valid without a category" do 
      subject.category = nil 
      subject.save
      expect(subject.errors.full_messages).to eql(["Category must exist","Category can't be blank"])
    end
  end
end 