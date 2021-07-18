class PassedTestsController < ApplicationController
  before_action :set_passed_test, only: %i[show update result]

  def show
    if @passed_test.time_is_over?
      redirect_to result_passed_test_path(@passed_test)
    end
  end

  def result; end

  def update
    @passed_test.accept!(params[:answer_ids])

    if @passed_test.completed?
      give_badges
      redirect_to result_passed_test_path(@passed_test)
    else
      redirect_to @passed_test
    end
  end

  private

  def set_passed_test
    @passed_test = PassedTest.find(params[:id])
  end

  def give_badges
    badges = BadgeService.new(@passed_test).call

    flash[:notice] = 'New achievement: ' + badges.map(&:title).join(', ') if badges.any?
  end
end
