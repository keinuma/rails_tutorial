require 'rails_helper'

RSpec.describe User, type: :model do
  context 'user exits' do
    it "user name is not empty" do
      user = User.create({ name: "Tutorial" })
      expect(user.name).to eq "Tutorial"
    end
  end

  context 'user is valid' do
    it "should be valid" do
      user = User.new(name: "Example User", email: "user@example.com", password: "testtest")
      expect(user.valid?).to be true
    end

    it "name should be present" do
      user = User.new(name: "   ", email: "user@example.com", password: "testtest")
      expect(user.valid?).to be false
    end

    it "email should be present" do
      user = User.new(name: "Test", email: "    ", password: "testtest")
      expect(user.valid?).to be false
    end

    it "name should not be too long" do
      user = User.new(name: "", email: "user@example.com")
      user.name = "a" * 51
      expect(user.valid?).to be false
    end

    it "email should not be too long" do
      user = User.new(name: "Test", email: "", password: "testtest")
      user.email = ("a" * 244) + "@example.com"
      expect(user.valid?).to be false
    end

    it "email validation should accept valid address" do
      user = User.new(name: "Test", email: "", password: "testtest")
      valid_addresses = %w[user@example.com USER@foo.COM A_US-ER@foo.bar.org first.last@foo.jp alice+bob@baz.cn]
      valid_addresses.each do |address|
        user.email = address
        expect(user.valid?).to be true 
      end
    end

    it "email validation should reject invalid address" do
      user = User.new(name: "Test", email: "", password: "testtest") 
      invalid_addresses = %w[user@example,com user_at_foo.org user.name@example. foo@bar_baz.com foo@bar+baz.com]
      invalid_addresses.each do |address|
        user.email = address
        expect(user.valid?).to be false
      end
    end

    it "email address should be unique" do
      user1 = User.create(name: "Test", email: "user@example.com", password: "testtest") 
      user2 = user1.dup
      user2.email = user1.email.upcase
      expect(user2.valid?).to be false
    end

    it "email address should be downcase" do
      user = User.create(name: "Test", email: "USeR@exaMPle.com", password: "testtest")  
      expect(user.email).to eq "user@example.com"
    end

    it "password should be present" do
      user = User.create(name: "Test", email: "USeR@exaMPle.com", password: "        ")  
      expect(user.valid?).to be false
    end

    it "password should have a minimum length" do
      user = User.create(name: "Test", email: "USeR@exaMPle.com", password: "test") 
      expect(user.valid?).to be false
    end
  end
end
