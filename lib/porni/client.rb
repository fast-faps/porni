require 'porni/hubs/base'

module Porni
  class Client
    DEFAULT_TIMEOUT = {
      connect: 2,
      read: 5,
      write: 20,
    }.freeze

    def initialize(options = {})
      @page = options[:page].to_s.downcase
      @timeout = DEFAULT_TIMEOUT.merge(options[:timeout] || {})
    end

    def agent
      @agent ||= case
                 when 'porn'
                   Porni::Hubs::Porn
                 when 'redtube'                                                              
                   Porni::Hubs::Redtube
                 when 'xvideos'                                                              
                   Porni::Hubs::Xvideos
                 when 'spankbang'
                   Porni::Hubs::SpankBang
                 when 'pornhub'
                   Porni::Hubs::Pornhub
                 else
                   raise Porni::MissingApiError
                 end
    end
  end
