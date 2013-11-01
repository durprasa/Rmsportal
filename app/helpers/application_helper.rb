module ApplicationHelper

	def title
    base_title = "Retail Management System"
    if @title.empty?
      base_title
    else
      "#{base_title} | #{@title}"
    end
  end
end
