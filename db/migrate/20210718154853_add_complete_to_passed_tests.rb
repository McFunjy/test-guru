class AddCompleteToPassedTests < ActiveRecord::Migration[6.1]
  def change
    add_column :passed_tests, :complete, :boolean, null: false, default: false
  end
end