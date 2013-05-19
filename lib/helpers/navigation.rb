module Helpers
  module Navigation
    def navigation_pages
      items = @items.find_all{ |item| !item[:nav_title].nil? }
      items = items.sort_by{ |item| item[:order] }
    end
  end
end
