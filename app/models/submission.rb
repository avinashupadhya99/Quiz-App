class Submission < ApplicationRecord
	belongs_to :quiz
	belongs_to :user
	has_many :quest_submissions
end