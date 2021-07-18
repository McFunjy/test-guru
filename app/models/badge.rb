class Badge < ApplicationRecord
  has_and_belongs_to_many :users

  validates :title, presence: true
  validates :image_url, presence: true
  validates :rule, presence: true

  enum rule: [:first_try_passage, :all_tests_by_category, :all_tests_by_level]
end