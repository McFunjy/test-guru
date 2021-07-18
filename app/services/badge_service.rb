class BadgeService
  def initialize(passed_test)
    @passed_test = passed_test
    @user = passed_test.user
  end

  def call
    Badge.select do |badge|
      @user.badges.push(badge) if "Specifications::Badges::#{badge.rule.camelize}".constantize.satisfied_by?(
        @passed_test, badge
      )
    end
  end
end