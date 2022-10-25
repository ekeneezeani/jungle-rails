require 'rails_helper'

RSpec.describe User, type: :model do

  describe "#password" do
    it "Should be thesame with the password_confirmation"  do
      @user = User.new(name:"Ekene", email: "looubposp@gmail.com", password:"11112222AAAA###", password_confirmation:"11112222AAAA###")
      @user.save
      expect(@user).to be_valid
    end

    it "Should have a password"  do
      @user = User.new(name:"Ekene", email: "lowerline@gmail.com", password:nil, password_confirmation:"11112222")
      @user.save

      expect(@user).not_to be_valid
    end

    it "Should have a password_confirmation"  do
      @user = User.new(name:"Ekene", email: "lowerline@gmail.com", password:nil, password_confirmation:nil)
      @user.save

      expect(@user).not_to be_valid
    end

    it "Should have a password greather than 12"  do
      @user = User.new(name:"Ekene", email: "kenny_rogers@gmail.com", password:"11112222AAAA###", password_confirmation:"11112222AAAA###")

      expect(@user.valid?).to eq(true)
    end
    
  end

  describe "#email" do
    it "Should be a unique email" do 
      @user1 = User.new(name:"Ekene", email: "lowerline@gmail.com", password:"11112222AAAA###", password_confirmation:"11112222AAAA###")
      @user1.save
      @user2 = User.new(name:"Looubs", email: "lowerline@gmail.com", password:"11112222AAAA###", password_confirmation:"11112222AAAA###")

      expect(@user2).not_to be_valid

    end

  end

  describe "#name" do
    it "Should have a name" do 
      @user1 = User.new(name:nil, email: "lowerline@gmail.com", password:"111122228888", password_confirmation:"111122228888")
      @user1.save
      

      expect(@user1).not_to be_valid
    end
  end


  describe "#login" do
    it "Should authenticate user when  user types in a few spaces before and/or after their email address" do 
      @user = User.authenticate_with_credentials("    lowerline@gmail.com", "11112222AAAA###")
   
      expect(@user).to be_instance_of(User)
    end


    it "Should authenticate if a user types in the wrong case for their email" do 
      @user = User.authenticate_with_credentials("    loWERline@Gmail.com", "11112222AAAA###")
   
      expect(@user).to be_instance_of(User)
    end
  end
end
