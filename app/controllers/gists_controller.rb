class GistsController < ApplicationController
  before_action :set_passed_test, only: :create

  def create
    result = GistQuestionService.new(@passed_test.current_question).call
    if result.success?
      current_user.gists.create!(question: @passed_test.current_question, url: result.url)
      flash[:notice] = "#{t('.success')} #{view_context.link_to(t('.view_gist'), result.url, target: '_blank')}"
    else
      flash[:alert] = t('.failure')
    end

    redirect_to @passed_test
  end

  private

  def set_passed_test
    @passed_test = PassedTest.find(params[:passed_test_id])
  end
end
