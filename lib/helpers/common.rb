module Helpers
  module Common
    def identifier(item)
      File.basename(item[:filename], File.extname(item[:filename]))
    end
  end
end
