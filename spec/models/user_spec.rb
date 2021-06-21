require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { FactoryBot.create(:user) } 
  
  
  it "is a valid user" do
    user.valid?
    expect(user).to be_valid
  end
  
  describe "name validation" do
    it "is valid with a name" do
      user.valid?
      expect(user.name).to eq "brian"
    end
    
    it "is invalid without a name" do
      user.name = nil
      user.valid?
      expect(user.errors[:name]).to include("can't be blank")
    end
    
    it "is too long name with over 51 chars" do
      user.name = "a"*51
      user.valid?
      expect(user.errors[:name]).to include("is too long (maximum is 50 characters)")
    end
  end
  
  describe "email validation" do
    it "is too long email with over 256 chars" do
      user.email = "a"*256
      user.valid?
      expect(user.errors[:email]).to include("is too long (maximum is 255 characters)")
    end
    
    it "accepts valid addresses" do
      valid_addresses = %w[user@example.com USER@foo.COM A_US-ER@foo.bar.org
                           first.last@foo.jp alice+bob@baz.cn]
      valid_addresses.each do |valid_address|
        user.email = valid_address
        user.valid?
        expect(user.errors[:email]).to include()
      end
    end
    
    it "rejects invalid addresses" do
      invalid_addresses = %w[user@example,com user_at_foo.org user.name@example.
                             foo@bar_baz.com foo@bar+baz.com foo@bar..com]
      invalid_addresses.each do |invalid_address|
        user.email = invalid_address
        user.valid?
        expect(user.errors[:email]).to include("is invalid")
      end
    end
    
    it "is invalid with a duplicate email address" do
      user
      user2 = FactoryBot.build(:user, email: "BRIAN@EXAMPLE.COM")
      user2.valid?
      expect(user2.errors[:email]).to include("has already been taken")
    end
    
    it "is saved as lower-case" do
      mixed_case_email = "Foo@ExAMPle.CoM"
      user.email = mixed_case_email
      user.save
      expect(mixed_case_email.downcase).to eq user.reload.email 
    end
  end
  
  describe "password validation" do
    it "is invalid without a password" do
      user.password = user.password_confirmation = " "*6
      user.valid?
      expect(user.errors[:password]).to include("can't be blank")
    end
    
    it "is invalid less than a minimum length" do
      user.password = user.password_confirmation = "a"*5
      user.valid?
      expect(user.errors[:password]).to include("is too short (minimum is 6 characters)")
    end
  end
  
  describe "authenticated? test" do
    it "returns false for a user with nil digest" do
      auth = user.authenticated?('')
      expect(auth).to be false
    end
  end
  
  it "destroys asscoiated posts" do
    user.posts.create!(content: "Lorem Ipsum")
    expect{
      user.destroy
    }.to change(Post.all, :count).by(-1)
  end
end
