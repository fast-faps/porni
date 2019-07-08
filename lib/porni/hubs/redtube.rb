require 'porni/http_utils'
require 'porni/hubs/client'
require 'porni/hubs/parser/redtube_parser'

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

      def get_video_standardized(id)
        body = get_video(id)
        Porni::Hubs::Parser::RedtubeParser.parse_video(body)
      end
    end
  end
end
