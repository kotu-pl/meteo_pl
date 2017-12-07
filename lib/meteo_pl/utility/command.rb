require 'optparse'

module MeteoPl
  module Utility
    class Command
      PERIODS = { short: 60, long: 84 }.freeze
      DEFAULT_PERIOD = :short
      DEFAULT_TIMEOUT = 2

      attr_reader :location, :options

      def initialize(args)
        @args = args
        @options = {
          timeout: DEFAULT_TIMEOUT,
          period: PERIODS[DEFAULT_PERIOD]
        }
      end

      def call
        parse_input
        set_location
        valid?
      ensure
        print_help unless valid?
      end

      private

      attr_reader :args

      def valid?
        !@invalid
      end

      def print_help
        puts "\n"
        option_parser.parse!(%w[--help])
      end

      def parse_input
        option_parser.parse!(args)
      rescue OptionParser::InvalidArgument, OptionParser::MissingArgument => e
        @invalid = true
        puts e.message
      end

      def set_location
        return unless valid?
        @location = args.join(' ')
        return unless @location.empty?
        @invalid = true
        puts 'LOCATION is not provided'
      end

      def option_parser
        @option_parser ||= OptionParser.new do |opts|
          opts.banner = 'Usage: LOCATION [options]'

          opts.on(
            '-t', '--timeout TIMEOUT', /^([1-9]|[1-5][0-9]|60)$/,
            'Provide request timeout, value from 1s to 60s, default: 2s'
          ) do |timeout|
            options[:timeout] = timeout.first.to_i
          end

          opts.on(
            '-p', '--period PERIOD', /short|long/,
            'Provide forecast period, either short (60h) or long (84h),' \
            ' default: short'
          ) do |period|
            options[:period] = PERIODS[period.to_sym]
          end

          opts.on('-h', '--help', 'Prints this help') do
            puts opts
          end
        end
      end
    end
  end
end
