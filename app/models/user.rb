class User < ApplicationRecord
  has_many :passed_tests, dependent: :destroy
  has_many :tests, through: :passed_tests
  has_many :created_tests, class_name: 'Test', foreign_key: :author_id, dependent: :nullify
  has_many :gists, dependent: :destroy
  has_and_belongs_to_many :badges

  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :validatable,
         :trackable,
         :confirmable

  validates :email, presence: true
  validates :email, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }

  def passed_tests_by_level(level)
    tests.where(level: level)
  end

  def passed_test(test)
    passed_tests.order(id: :desc).find_by(test: test)
  end

  def admin?
    is_a?(Admin)
  end

  def has_not_one?(badge)
    self.badges.find_by(id: badge.id).nil?
  end
end
