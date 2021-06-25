class CreatePassedTests < ActiveRecord::Migration[6.1]
  def change
    create_table :passed_tests do |t|
      t.references :test, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
