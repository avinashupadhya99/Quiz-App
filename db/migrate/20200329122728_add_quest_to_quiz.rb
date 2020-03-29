class AddQuestToQuiz < ActiveRecord::Migration[5.1]
  def change
  	add_reference :quizzes, :question, foreign_key: true
  end
end
