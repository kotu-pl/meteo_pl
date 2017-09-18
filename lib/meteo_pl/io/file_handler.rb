require 'tempfile'

module MeteoPl
  module IO
    class FileHandler
      def open
        Tempfile.open(['meteo_graph', '.png']) do |temp_file|
          yield(temp_file)
        end
      end
    end
  end
end
