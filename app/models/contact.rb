class Contact < ApplicationRecord
	validates :account_id, presence: true
	validates :first_name, presence: true
	validates :last_name, presence: true
	belongs_to :account
end
