class GistQuestionService
  Responce = Struct.new(:status, :url) do

    def success?
      status == 201
    end
  end
  
  def initialize(question, client: nil)
    @question = question
    @test = @question.test
    @client = client || Octokit::Client.new(access_token: ENV.fetch('GITHUB_ACCESS_TOKEN'))
  end

  def call
    responce = @client.create_gist(gist_params)
    Responce.new(@client.last_response&.status, responce.html_url)
  end

  private

  def gist_params
    {
      description: I18n.t('services.gist_question_service', title: @test.title),
      files: {
        'test-guru-question.txt' => {
          content: gist_content
        }
      }
    }
  end

  def gist_content
    [@question.body, *@question.answers.pluck(:body)].join("\n")
  end
end
