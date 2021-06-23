class User < ApplicationRecord
  def passed_tests_by_level(level)
    Test.joins('JOIN passed_tests ON tests.id = passed_tests.test_id')
        .where('passed_tests.user_id = :user_id AND level = :level', user_id: id, level: level)
  end
end
