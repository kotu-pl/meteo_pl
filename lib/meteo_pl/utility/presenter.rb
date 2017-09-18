module MeteoPl
  module Utility
    class Presenter
      def initialize(net_fetcher, file_handler, file_opener, graph)
        @net_fetcher = net_fetcher
        @file_handler = file_handler
        @file_opener = file_opener
        @graph = graph
      end

      def show
        file_handler.open do |temp_file|
          graph_content = net_fetcher.fetch(graph.uri) { |resp| resp.body }
          temp_file.write(graph_content)
          file_opener.path = temp_file.path
          file_opener.open
        end
      end

      private

      attr_reader :net_fetcher, :file_handler, :file_opener, :graph
    end
  end
end
