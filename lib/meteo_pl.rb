#!/usr/bin/env ruby
require_relative 'meteo_pl/io/file_handler'
require_relative 'meteo_pl/io/image_opener'
require_relative 'meteo_pl/net/http'
require_relative 'meteo_pl/utility/command'
require_relative 'meteo_pl/utility/graph'
require_relative 'meteo_pl/utility/presenter'
require_relative 'meteo_pl/utility/forecast'

command_line = MeteoPl::Utility::Command.new(ARGV)

if command_line.call
  MeteoPl::Utility::Forecast.for(
    command_line.location,
    timeout: command_line.options[:timeout],
    period: command_line.options[:period]
  )
end
