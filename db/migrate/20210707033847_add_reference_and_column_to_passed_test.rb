class AddReferenceAndColumnToPassedTest < ActiveRecord::Migration[6.1]
  def change
    add_reference :passed_tests, :current_question, foreign_key: { to_table: :questions }
    add_column :passed_tests, :correct_questions, :integer, default: 0
  end
end
