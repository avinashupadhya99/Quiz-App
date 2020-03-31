class Question < ApplicationRecord
	belongs_to :quiz
	has_many :options
	validates :questions, presence: true
	validates :answer, presence: true
end