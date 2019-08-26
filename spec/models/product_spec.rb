require 'rails_helper'

RSpec.describe Product, type: :model do
 

  describe 'Validations' do
  
    it "is valid with valid attributes" do
      category = Category.new
      category.save!
      product = Product.new(name: "Selin", quantity:2, price: 10000, category_id: category.id)
      expect(product).to be_valid
    end

    it "is not valid without a name" do
      category = Category.new
      category.save!
      product = Product.new(name: nil , quantity:2, price: 10000, category_id: category.id)
      expect(product).to_not be_valid
    end

    it "is not valid without a price" do
      category = Category.new
      category.save!
      product = Product.new(name: "Jessie", quantity:2, price: nil, category_id: category.id)
      expect(product).to_not be_valid
    end

    it "is not valid without a quantity" do
      category = Category.new
      category.save!
      product = Product.new(name: "Bentley", quantity: nil, price: 60000000000, category_id: category.id)
      expect(product).to_not be_valid
    end

    it "is not valid without a category" do
      product = Product.new(name: "Bentley", quantity: 1, price: 60000000000, category_id: nil)
      expect(product).to_not be_valid
    end

 end
end



