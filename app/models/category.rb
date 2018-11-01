class Category < ApplicationRecord
	has_many :articles, dependent: :destroy
	validates :name, 
		presence: true, 
		length: { minimum: 5 }, 
		uniqueness: true
end
