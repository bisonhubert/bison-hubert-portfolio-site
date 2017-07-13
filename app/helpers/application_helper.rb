module ApplicationHelper
  def full_title(page_title = '')
    base_title = 'Bison Hubert'
    if page_title.empty?
      base_title
    else
      page_title + ' | ' + base_title
    end
  end

  def format_date(date = DateTime.new)
    date.strftime("%b %d, %Y")
  end
end
