class Quiz < ApplicationRecord
	has_many :questions
	has_many :quiz_categories
	has_many :submissions
  	has_many :categories, through: :quiz_categories
	validates :name, presence: true, length: {minimum: 3, maximum: 30}
end