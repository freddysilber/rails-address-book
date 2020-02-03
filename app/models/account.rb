class Account < ApplicationRecord
	before_validation :capitalize_name
	validates :name, presence: true
	belongs_to :user
	has_many :contacts, :dependent => :destroy
	has_many :projects, :dependent => :destroy
	has_many :tasks, through: :projects, :dependent => :destroy

	private
	
	def capitalize_name
		self.name = self.name.capitalize
	end
end