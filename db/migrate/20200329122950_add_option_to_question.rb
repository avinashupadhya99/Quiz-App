class AddOptionToQuestion < ActiveRecord::Migration[5.1]
  def change
  	add_reference :questions, :option, foreign_key: true
  end
end
