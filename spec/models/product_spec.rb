require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    let(:category) { Category.create(name: "Test Category") }
    let(:product) { Product.new(name: "Test Product", category: category, price: 100, quantity: 2) }

    it "is required for name to be present" do
      product.name = nil
      product.valid?
      expect(product.errors.full_messages).to include("Name can't be blank")
    end

    it "is required for valid price to be present" do
      product.price = nil
      product.valid?
      expect(product.errors.full_messages).to include()
    end

    it "is required for valid quantity to be present" do
      product.quantity = nil
      product.valid?
      expect(product.errors.full_messages).to include("Quantity can't be blank")
    end

    it "is required for valid category to be present" do
      product.category = nil
      product.valid?
      expect(product.errors.full_messages).to include("Category can't be blank")
    end

    it "is valid for product with all given properties" do
      product.name = "Test Product"
      expect(product).to be_valid
    end

  end
end


