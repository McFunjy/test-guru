class Specifications::Badges::FirstAttemptPassage
  def self.satisfied_by?(passed_test, badge)
    passed_test.complete && passed_test.user.tests.where(tests: { id: passed_test.test.id }).count == 1
  end
end