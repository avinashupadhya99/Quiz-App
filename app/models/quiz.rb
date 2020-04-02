class Quiz < ApplicationRecord
	has_many :questions
	validates :name, presence: true, length: {minimum: 3, maximum: 30}
end