require 'rails_helper'

RSpec.describe User, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"

  describe "Validation" do
  	it "is valid with valid attributes" do
  	user = User.new(name: "Johnny boy", email: "johnnyboy@gmail.com")
  	end

  	it "is invalid without a name" do
  		bad_user = User.new(name: nil, email: "test@gmail.com")
  		expect(bad_user).to_not be_valid
  	end

  	it "is invalid without an email" do
  		bad_user = User.new(name: "Johnny", email: nil)
  		expect(bad_user).to_not be_valid
  	end
  end

  describe "Associations" do 
  	it "should have many memos" do
  		assoc = User.reflect_on_association(:memos)
  		expect(assoc.macro).to eq :has_many
  	end
  end

end
