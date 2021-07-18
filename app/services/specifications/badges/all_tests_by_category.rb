class Specifications::Badges::AllTestsByCategory
  def self.satisfied_by?(passed_test, badge)
    passed_test.user.has_not_one?(badge) &&
    Test.all.by_category_id(badge.rule_value).count ==
    passed_test.user.passed_tests.by_category_id(badge.rule_value).complete.no_repetitions.count
  end
end