module MeteoPl
  module Utility
    class Graph
      attr_reader :net_fetcher, :location, :period

      def initialize(net_fetcher, location, period)
        @net_fetcher = net_fetcher
        @location = location
        @period = period
      end

      def uri
        raise NotImplemented
      end
    end

    class MobileMeteoGraph < Graph
      FORM_URL = 'http://m.meteo.pl/search/pl'.freeze

      def uri
        @uri ||= begin
          prepare_initial_request_uri
          fetch_initial_data
          return unless initial_response && initial_response.code == '302'
          fetch_graph_page
          fetch_graph_uri
        end
      end

      private

      attr_reader :initial_request_uri, :initial_response, :graph_page

      def prepare_initial_request_uri
        @initial_request_uri = begin
          uri = URI(FORM_URL)
          uri.query = URI.encode_www_form(
            miastoPL: location,
            typePL: :city,
            prognozaPL: period
          )
          uri
        end
      end

      def fetch_initial_data
        net_fetcher.fetch(initial_request_uri) do |response|
          @initial_response = response
        end
      end

      def fetch_graph_page
        @graph_page =
          net_fetcher.fetch(URI(initial_response['location'])) do |response|
            response.body
          end
      end

      def fetch_graph_uri
        URI(graph_page.match(/http.+mgram_pict\.php([^"]+)/)[0])
      end
    end
  end
end
