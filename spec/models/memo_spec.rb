require 'rails_helper'

RSpec.describe Memo, type: :model do
	# Test subject
	subject {
		User.new(name: "Johnny boy", email: "johnnyboy@gmail.com")
	}

  describe "Validation" do
  	it "is valid with valid attributes" do
  		memo = Memo.new(title: "To do List", text_body: "hello world", date: DateTime.now.utc, user: subject )
  		expect(memo).to be_valid
   	end

   	it "is invalid without a title" do
   		bad_memo = Memo.new(title: nil, text_body: "hello world", date: DateTime.now.utc, user: subject)
   		expect(bad_memo).to_not be_valid
   	end 

   	it "is invalid without a text body" do
   		bad_memo = Memo.new(title: "To do List", text_body: nil, date: DateTime.now.utc, user: subject)
   		expect(bad_memo).to_not be_valid
   	end

   	it "is invalid without a date" do
   		bad_memo = Memo.new(title: "To do List", text_body: "hello world", date: nil, user: subject)
   		expect(bad_memo).to_not be_valid
   	end

   	it "is invalid without a user" do
   		bad_memo = Memo.new(title: "To do List", text_body: "hello world", date: DateTime.now.utc, user: nil)
   		expect(bad_memo).to_not be_valid
   	end
  end

  describe "Associations" do
  	it "should have many memos" do
  		assoc = Memo.reflect_on_association(:user)
  		expect(assoc.macro).to eq :belongs_to
  	end
  end
end
