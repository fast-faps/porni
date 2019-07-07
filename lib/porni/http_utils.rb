require 'porni/request'

module Porni
  module HttpUtils
    def perform_request(request_method, path, options = {})
      Porni::Request.new(self, request_method, path, options = {}).perform
    end
  end
end
