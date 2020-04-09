class Submission < ApplicationRecord
	belongs_to :quiz
	belongs_to :user
	has_many :quest_submissions, :dependent => :destroy
	accepts_nested_attributes_for :quest_submissions
end