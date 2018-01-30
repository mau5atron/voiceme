class Memo < ApplicationRecord
	belongs_to :user
	validates :title, presence: true
	validates :text_body, presence: true
	validates :date, presence: true
	validates :user_id, presence: true
end
