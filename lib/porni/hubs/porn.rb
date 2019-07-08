require 'porni/http_utils'
require 'porni/hubs/client'
require 'porni/hubs/parser/porn_parser'

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

      def get_video_standardized(id)
        body = get_video(id)
        Porni::Hubs::Parser::PornParser.parse_video(body)
      end
    end
  end
end
