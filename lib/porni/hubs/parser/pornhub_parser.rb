require 'porni/video'
require 'porni/hubs/parser/base'

module Porni
  module Hubs
    module Parser
      class PornhubParser < Base
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
            tags: tags(video),
            pornstars: pornstars(video),
            valid: true,
            raw: @body
          }
        end

        private
          def tags(video)
            all_tags = []
            if video["tags"]
              all_tags << video["tags"].map {|tag| tag["tag_name"]}
            end
            if video["categories"]
              all_tags << video["categories"].map {|tag| tag["category"]}
            end
            all_tags.flatten
          end

          def pornstars(video)
            all_pornstars = []
            if video["pornstars"]
              all_pornstars << video["pornstars"].map {|tag| tag["pornstar_name"]}
            end
            all_pornstars.flatten
          end
      end
    end
  end
end
