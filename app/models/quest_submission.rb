class QuestSubmission < ApplicationRecord
	belongs_to :question
	belongs_to :submission
end