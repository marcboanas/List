module ApplicationHelper
  def full_title(page_title = '')
    base_title = "List"
    if page_title.empty?
      base_title
    else
      "#{page_title} | #{base_title}"
    end
  end
  
  def possesive(text)
    if text.last != "s"
      return "#{text}'s"
    else
      return "#{text}'"
    end
  end
end
