class Test < ApplicationRecord
  belongs_to :category
  belongs_to :author, class_name: 'User', foreign_key: author_id
  has_many :questions
  has_many :passed_tests
  has_many :users, through: :passed_tests
  def self.tests_by_category(title)
    joins(:category)
      .where(categories: { title: title })
      .order(title: :desc)
      .pluck(:title)
  end
end
