class Question < ApplicationRecord
	has_many :quizzes
	belongs_to :option
end