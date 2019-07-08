require 'porni/video'
require 'porni/hubs/parser/base'

module Porni
  module Hubs
    module Parser
      class RedtubeParser < Base
        def parse_video
          if @body["video"]
            Porni::Video.new(valid_attributes)
          else
            Porni::Video.new(invalid_attributes)
          end
        end

        def valid_attributes
          video = @body["video"]

          {
            duration: video["duration"],
            title: video["title"],
            thumb: video["default_thumb"] || video["thumb"],
            views: video["views"],
            channel: nil,
            tags: video["tags"] || [],
            pornstars: [],
            valid: true,
            raw: @body
          }
        end
      end
    end
  end
end
