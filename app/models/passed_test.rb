class PassedTest < ApplicationRecord
  PASSING_SCORE = 85

  belongs_to :user
  belongs_to :test
  belongs_to :current_question, class_name: 'Question', optional: true

  before_validation :before_validation_set_question, on: %i[create update]

  before_save :before_save_set_complete_attribute

  scope :complete, -> { where(complete: true) }
  scope :by_category_id, -> (category_id) { joins(:test).where(tests: { category_id: category_id }) }
  scope :by_level, -> (level) { joins(:test).where(tests: { level: level }) }
  scope :no_repetitions, -> { select(:test_id).distinct }

  def completed?
    current_question.nil?
  end

  def accept!(answer_ids)
    self.correct_questions += 1 if correct_answer?(answer_ids)
    save!
  end

  def total_test_questions
    test.questions.count
  end

  def percent_correct
    (correct_questions.to_f * 100 / total_test_questions).round(2)
  end

  def success?
    percent_correct >= PASSING_SCORE && !(time_is_over?)
  end

  def current_question_position
    test.questions.order(:id).where('id < ?', current_question.id).count + 1
  end

  def left_time
    return unless test.timer
    remaining_time = set_timer - Time.current
    return 0 if remaining_time <= 0
    remaining_time
  end

  def time_is_over?
    left_time == 0
  end

  def current_timer(time)
    return unless time
    timer = time.round
    min = timer / 60
    sec = timer % 60
    "#{min}:#{sec}"
  end

  private

  def set_timer
    created_at + test.timer.minute
  end

  def before_validation_set_question
    self.current_question = next_question
  end

  def correct_answer?(answer_ids)
    correct_answers.ids.sort == Array(answer_ids).map(&:to_i).sort
  end

  def correct_answers
    current_question.answers.correct
  end

  def next_question
    if new_record?
      test.questions.first
    else
      test.questions.order(:id).where('id > ?', current_question.id).first
    end
  end

  def before_save_set_complete_attribute
    self.complete = success?
  end
end
