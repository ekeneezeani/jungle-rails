require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    describe "#name" do

      it "Should save if all the fields are provided" do

        @category = Category.new(name:"African Wild")
        @category.save

        @product = Product.new(name:"African Wild", image:"uploads/product/image/8/plante_8.jpg",price:5000,quantity:2, category_id: @category.id)
        @product.save

        expect(@product).to be_valid
      end
    end

    describe "#name" do
      it "Should have a name" do

        @category = Category.new(name:"African Wild")
        @category.save

        @product = Product.new(name:nil, image:"uploads/product/image/8/plante_8.jpg",price:5000,quantity:2, category_id: @category.id)
        @product.save

        expect(@product).not_to be_valid
      end
    end

    describe "#price" do
      it "Should have a price" do

        @category = Category.new(name:"African Wild")
        @category.save

        @product = Product.new(name:"Chicheron", image:"uploads/product/image/8/plante_8.jpg",price: nil,quantity:2, category_id: @category.id)
        @product.save

        expect(@product).not_to be_valid
      end
    end

    describe "#quantity" do
      it "Should have a quantity" do

        @category = Category.new(name:"African Wild")
        @category.save

        @product = Product.new(name:"Chicheron", image:"uploads/product/image/8/plante_8.jpg",price: 5000,quantity:nil, category_id: @category.id)
        @product.save

        expect(@product).not_to be_valid
      end
    end
    describe "#category" do
      it "Should have a category" do

        @category = Category.new(name:"African Wild")
        @category.save

        @product = Product.new(name:"Chicheron", image:"uploads/product/image/8/plante_8.jpg",price: 5000,quantity:nil, category_id: nil)
        @product.save

        expect(@product).not_to be_valid
      end
    end


  end
end
