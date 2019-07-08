require 'porni/video'
require 'porni/hubs/parser/base'

module Porni
  module Hubs
    module Parser
      class PornParser < Base
        def parse_video
          if @body["success"]
            Porni::Video.new(valid_attributes)
          else
            Porni::Video.new(invalid_attributes)
          end
        end

        def valid_attributes
          video = @body["result"][0]
          return invalid_attributes unless video

          {
            duration: seconds_to_hms(video["duration"]),
            title: video["title"],
            thumb: video["thumb"],
            views: video["views"],
            channel: video["channel"],
            tags: video["tags"] || [],
            pornstars: video["actors"] || [],
            valid: true,
            raw: @body
          }
        end

        private
          def seconds_to_hms(sec)
            [sec / 60 % 60, sec % 60].map{|t| t.to_s.rjust(2,'0')}.join(':')
          end
      end
    end
  end
end
