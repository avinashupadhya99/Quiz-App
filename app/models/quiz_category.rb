class QuizCategory < ApplicationRecord
	belongs_to :quiz
	belongs_to :article

end