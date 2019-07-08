module Porni
  module Hubs
    module Parser
      class Base
        def initialize(body)
          @body = body
        end

        def self.parse_video(body)
          new(body).parse_video
        end

        def invalid_attributes
          { valid: false, raw: @body }
        end
      end
    end
  end
end
