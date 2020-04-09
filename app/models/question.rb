class Question < ApplicationRecord
	belongs_to :quiz
	has_many :options, :dependent => :destroy
	has_many :quest_submissions
	validates :questions, presence: true, length: {minimum: 3, maximum: 60}
	validates :score, presence: true
end