class Memo < ApplicationRecord
	belongs_to :user
	validates :title, :text_body, :date, presence: true
end
