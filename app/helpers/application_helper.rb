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
end
