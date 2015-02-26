module ApplicationHelper

  def page_title
    content_for?(:title) ? "Flix - #{content_for(:title)}" : 'Flix'
  end

  def nav_link_to(text, url)
    classes = ['button']
    classes << 'active' if current_page?(url)
    link_to text, url, class: classes.join(' ')
  end


end
