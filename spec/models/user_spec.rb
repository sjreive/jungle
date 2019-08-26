require 'rails_helper'

RSpec.describe User, type: :model do
  
  describe 'Validations' do

    user = User.new(name: "Sarah", email:"sarah@sarah.com", password: "dogs", password_confirmation: "dogs")
    
    it "is valid with valid attributes" do 
      expect(user).to be_valid
    end

    it "is not valid when the password and password confirmation don't match" do 
      user.password = "DOGS"
      expect(user).to_not be_valid
    end

    it "is not valid when there is no name" do 
      user.name = nil
      expect(user).to_not be_valid
    end

    it "is not valid when there is no email" do 
      user.email = nil
      expect(user).to_not be_valid
    end

    it "is not valid when the email already exists in the database" do 
      user = User.new(name: "Sarah", email:"sarah@sarah.com", password: "dogs", password_confirmation: "dogs")
      user.save!
      user2 = User.new(name: "Sarah", email:"sarah@sarah.com", password: "dogs", password_confirmation: "dogs")
      expect(user2).to_not be_valid
    end

    it "is not valid when the password is shorter than 3 characters" do 
      user.password = "d"
      user.password_confirmation= "d"
      expect(user).to_not be_valid
    end

  end
  
end