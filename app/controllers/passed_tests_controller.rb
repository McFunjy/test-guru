class PassedTestsController < ApplicationController
  before_action :set_passed_test, only: %i[show update result gist]

  def show; end

  def result; end

  def update
    @passed_test.accept!(params[:answer_ids])

    if @passed_test.completed?
      TestsMailer.completed_test(@passed_test).deliver_now
      redirect_to result_passed_test_path(@passed_test)
    else
      render :show
    end
  end

  def gist
    result = GistQuestionService.new(@passed_test.current_question).call
    if result
      current_user.gists.create!(question: @passed_test.current_question, url: result.html_url)
      flash[:notice] = "#{t('.success')} #{view_context.link_to(t('.view_gist'), result.html_url, target: '_blank')}"
    else
      flash[:alert] = t('.failure')
    end

    redirect_to @passed_test
  end

  private

  def set_passed_test
    @passed_test = PassedTest.find(params[:id])
  end
end
