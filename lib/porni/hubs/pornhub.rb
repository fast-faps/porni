require 'porni/http_utils'
require 'porni/hubs/client'
require 'porni/hubs/parser/pornhub_parser'

module Porni
  module Hubs
    class Pornhub < Client
      include Porni::HttpUtils

      def base_url
        "https://www.pornhub.com/webmasters"
      end

      def get_video(id)
        perform_request(:get, "/video_by_id?id=#{id}", {})
      end

      def get_video_standardized(id)
        body = perform_request(:get, "/video_by_id?id=#{id}", {})
        Porni::Hubs::Parser::PornhubParser.parse_video(body)
      end
    end
  end
end
