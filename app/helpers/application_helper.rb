# frozen_string_literal: true

module ApplicationHelper
  def current_year
    Date.current.year
  end

  def github_url(author, repo)
    link_to 'Project Test-guru', "https://github.com/#{author}/#{repo}", target: '_blank', rel: 'nofollow noopener'
  end
end
