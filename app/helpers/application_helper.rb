module ApplicationHelper

   # Generates a full title for the page
   def get_title(page_title)
      base_title = "Game Dev Soc UNSW"
      if (page_title.empty?)
         return base_title
      else
         return "#{base_title} | #{page_title}"
      end
   end
   def markdown(text)
      options = [ :hard_wrap, :filter_html, :autolink, :no_intraemphasis, :fenced_code, :gh_blockcode ]
      Redcarpet.new(text, *options).to_html.html_safe
   end

end
