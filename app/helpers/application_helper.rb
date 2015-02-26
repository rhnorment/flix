module ApplicationHelper

  def page_title
    content_for?(:title) ? "Flix - #{content_for(:title)}" : 'Flix'
  end


end
