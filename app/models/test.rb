class Test < ApplicationRecord
  def self.tests_by_category(title)
    Test.joins('JOIN categories ON tests.category_id = categories.id')
        .where(categories: { title: title })
        .order('tests.title DESC')
        .pluck(:title)
  end
end
