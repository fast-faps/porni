require 'http'
require 'oj'
require 'addressable/uri'

module Porni
  class Request
    def initialize(client, request_method, path, options = {})
      @client         = client
      @request_method = request_method
      @uri            = Addressable::URI.parse(@client.base_url + path)
      @headers        = options[:headers] || {}
      @path           = @uri.path
      @options        = options
    end

    def perform
      options_key = @request_method == :get ? :params : :form
      response    = http_client.public_send(@request_method, @uri.to_s)

      STDERR.puts response.body if ENV['DEBUG'] == 'true'

      fail_or_return(response.code, response.body.empty? ? '' : Oj.load(response.to_s, mode: :null))
    end

    private

    def fail_or_return(code, body)
      raise if code >= 300
      body
    end

    def http_client
      HTTP.timeout(connect: @client.timeout[:connect], read: @client.timeout[:read], write: @client.timeout[:write])
    end
  end
end
