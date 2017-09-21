module MeteoPl
  module Utility
    module Forecast
      def for(location, timeout:, period:)
        http_fetcher = Net::Http.new(timeout)
        graph = MobileMeteoGraph.new(
          http_fetcher, location, period
        )

        unless !!graph.uri
          puts "Graph for given location does not exists"
          return
        end

        Presenter.new(
          http_fetcher, IO::FileHandler.new, IO::ImageOpener.new, graph
        ).show
      end
      module_function :for
    end
  end
end
