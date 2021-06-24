class User < ApplicationRecord
  has_many :passed_tests
  has_many :tests, through: :passed_tests
  has_many :created_tests, class_name: 'Test', foreign_key: author_id
  def passed_tests_by_level(level)
    tests.where(level: level)
  end
end
