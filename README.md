# MeteoPL

**Basic usage:**

```
require 'meteo_pl'

command_line = MeteoPl::Utility::Command.new(ARGV)

if command_line.call
 MeteoPl::Utility::Forecast.for(
   command_line.location,
   timeout: command_line.options[:timeout],
   period: command_line.options[:period]
 )
end
```
