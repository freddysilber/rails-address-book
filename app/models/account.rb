class Account < ApplicationRecord
	belongs_to :user
	has_many :contacts, :dependent => :destroy
	has_many :projects, :dependent => :destroy
	has_many :tasks, through: :projects, :dependent => :destroy
end