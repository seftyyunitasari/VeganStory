require 'rails_helper'

RSpec.describe Product, type: :model do
  describe "Validation test" do
    
    before do
      @category = Category.create(name: "Fruit")
    end
  
    it "is valid to create product with category_id, name, price, and stock" do
      product = Product.new(
          category_id: @category.id,
          name: "Cherry",
          price: 500,
          stock: 100
      )
      expect(product).to be_valid
    end
  
    it "is invalid to create product without name" do
      product = Product.new(
          category_id: @category.id,
          name: "",
          price: 500,
          stock: 100
      )
      expect(product).not_to be_valid
    end
  
    it "is invalid to create product without price" do
      product = Product.new(
          category_id: @category.id,
          name: "Cherry",
          stock: 100
      )
      expect(product).not_to be_valid
    end
  
    it "is invalid to create product without stock" do
      product = Product.new(
          category_id: @category.id,
          name: "Cherry",
          price: 500,
      )
      expect(product).not_to be_valid
    end
  end
end
