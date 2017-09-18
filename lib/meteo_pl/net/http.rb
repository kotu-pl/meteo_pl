require 'net/http'

module MeteoPl
  module Net
    class Http
      def initialize(timeout)
        @timeout = timeout
      end

      def fetch(uri)
        raise ArgumentError unless block_given?

        ::Net::HTTP.start(uri.host, uri.port, use_ssl: uri.scheme == 'https',
          open_timeout: @timeout, read_tieout: @timeout) do |http|
            yield http.request(::Net::HTTP::Get.new(uri))
        end
      end
    end
  end
end
