require 'porni/http_utils'
require 'porni/hubs/client'

module Porni
  module Hubs
    class Redtube < Client
      include Porni::HttpUtils

      def base_url
        "https://api.redtube.com"
      end

      def get_video(id)
        perform_request(:get, "/?data=redtube.Videos.getVideoById&video_id=#{id}&output=json&thumbsize=all", {})
      end
    end
  end
end
