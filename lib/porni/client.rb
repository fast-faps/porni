require 'porni/hubs/base'

module Porni
  class Client
    ALLOWED_PAGES = ['porn.com', 'redtube.com', 'pornhub.com']

    def self.get_agent(options = {})
      page = options[:page]
      case page
      when 'porn'
        Porni::Hubs::Porn.new(options)
      when 'redtube'
        Porni::Hubs::Redtube.new(options)
      when 'xvideos'
        Porni::Hubs::Xvideos.new(options)
      when 'spankbang'
        Porni::Hubs::Spankbang.new(options)
      when 'pornhub'
        Porni::Hubs::Pornhub.new(options)
      else
        raise Porni::MissingApiError
      end
    end
  end
end
