require 'porni/http_utils'
require 'porni/hubs/client'

module Porni
  module Hubs
    class Xvideos < Client
      include Porni::HttpUtils

      def base_url
      end

      def get_video(id)
        {}
      end
    end
  end
end
