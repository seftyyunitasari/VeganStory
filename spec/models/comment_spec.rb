require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe "Validation test" do

    before do
      @user = FactoryBot.create(
        :user,
        name: "test name",
        email: "test_email@comment.com",
        address: "test address",
        phone: "xxx xxx xxx xxx",
        password: "password"
      )

      @category = FactoryBot.create(
        :category,
        name: "Vegetables")

      @product = FactoryBot.create(
        :product,
        category_id: @category.id,
        name: "Cherry",
        price: 500,
        stock: 100
      )
    end

    it "is valid to write comment" do
      comment = Comment.new(
        user_id: @user.id,
        product_id: @product.id,
        content: "Comment"
      )
      expect(comment).to be_valid
    end

    it "is invalid to write empty comment" do
      comment = Comment.new(
        user_id: @user.id,
        product_id: @product.id,
        content: ""
      )
      expect(comment).not_to be_valid
    end
  end
end
