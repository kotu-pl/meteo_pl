module MeteoPl
  module IO
    class ImageOpener
      attr_accessor :path

      def open
        case RbConfig::CONFIG['host_os']
          when /mswin|mingw|cygwin/
            `start #{path}`
          when /darwin/
            `open #{path}`
          when /linux|bsd/
            `xdg-open #{path}`
        end
      end
    end
  end
end
