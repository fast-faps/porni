require 'porni/http_utils'
require 'porni/hubs/client'

module Porni
  module Hubs
    class Porn < Client
      include Porni::HttpUtils

      def base_url
        "https://api.porn.com/videos"
      end

      def get_video(id)
        perform_request(:get, "/find.json?id=#{id}", {})
      end
    end
  end
end
