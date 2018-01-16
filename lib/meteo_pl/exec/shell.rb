module MeteoPl
  module Exec
    module Shell
      def call(args)
        command_line = MeteoPl::Utility::Command.new(args)
        return unless command_line.call

        location =  command_line.location
        timeout = command_line.options[:timeout]
        period = command_line.options[:period]

        http_fetcher = Net::Http.new(timeout)
        graph = Utility::MobileMeteoGraph.new(
          http_fetcher, location, period
        )

        unless graph.uri
          puts 'Graph for given location does not exists'
          return
        end

        Utility::Presenter.new(
          http_fetcher, IO::FileHandler.new, IO::ImageOpener.new, graph
        ).show
      end
      module_function :call
    end
  end
end
