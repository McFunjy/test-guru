class Answer < ApplicationRecord
  belongs_to :question

  validates :body, presence: true
  validate :validate_limit_of_answers

  scope :correct, -> { where(correct: true) }

  private

  def validate_limit_of_answers
    errors.add(:question, 'Question can have form 1 to 4 answers') if question.answers.count >= 4
  end
end
