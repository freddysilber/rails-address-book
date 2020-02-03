class Contact < ApplicationRecord
	before_validation :capitalize_name
	validates :account_id, presence: true
	validates :first_name, presence: true
	validates :last_name, presence: true
	belongs_to :account

	private

	def capitalize_name
		self.first_name = self.first_name.capitalize
		self.last_name = self.last_name.capitalize
	end
end
