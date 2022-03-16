require "rails_helper"
RSpec.describe User, type: :model do
    describe "Validation test" do
        it "is valid to create user with name, email, address, phone, password, and password confirmation" do
            user = User.new(
                name: "General User",
                email: "user@example.com",
                address: "Example Street",
                phone: "xxx-xxx-xxx",
                password: "password"
            )
            expect(user).to be_valid
        end

        it "is invalid to create user without name" do
            user = User.new(
                name: "",
                email: "user@example",
                address: "Example Street",
                phone: "xxx-xxx-xxx",
                password: "password"
            )
            expect(user).not_to be_valid
        end

        it "is invalid to create user without email" do
            user = User.new(
                name: "General User",
                email: "",
                address: "Example Street",
                phone: "xxx-xxx-xxx",
                password: "password"
            )
            expect(user).not_to be_valid
        end
        
        it "is invalid to create user without address" do
            user = User.new(
                name: "General User",
                email: "user@example.com",
                address: "",
                phone: "xxx-xxx-xxx",
                password: "password"
            )
            expect(user).not_to be_valid
        end

        it "is invalid to create user without phone number" do
            user = User.new(
                name: "General User",
                email: "user@example.com",
                address: "Example Street",
                phone: "",
                password: "password"
            )
            expect(user).not_to be_valid
        end

        it "is invalid to create user without password" do
            user = User.new(
                name: "General User",
                email: "user@example.com",
                address: "Example Street",
                phone: "xxx-xxx-xxx",
                password: " "
            )
            expect(user).not_to be_valid
        end
    end
end