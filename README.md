# meteo_pl

[![Gem Version](https://img.shields.io/gem/v/meteo_pl.svg?style=flat-square&label=version)](https://rubygems.org/gems/meteo_pl)
[![Build Status](https://img.shields.io/travis/kotu-pl/meteo_pl/master.svg?style=flat-square&label=build)](https://travis-ci.org/kotu-pl/meteo_pl)
[![Maintainability](https://api.codeclimate.com/v1/badges/720f2172fb5523c968f5/maintainability)](https://codeclimate.com/github/kotu-pl/meteo_pl/maintainability)

This gem fetches and manipulates on weather forecast graphs from http://www.meteo.pl service.
It allows to fetch coamps and um diagrams separately and open open them in your default image viewer.

**Architecture**

*lib/meteo_pl/exec* directory contains usage examples (as MeteoPl::Exec::Shell class),
you should use provided compontents to prepare similar class (or script) that meets your requirements. 

**Usage example:**

Install gem in system-wide context, than create executable `meteo` named script:

```ruby
#!/usr/bin/env ruby
require 'meteo_pl'

MeteoPl::Exec::Shell.call(ARGV)
```

Than you'll be able to generate the weather forecast diagram from your command line:

```
/some_path/meteo Warszawa -p long
```
or directly when script's directory is within your $PATH:

```
meteo Warszawa -p long
```

To check all available options just run a script w/o arguments or with -h flag.

### Versions

*   2.0.5 MeteoPl::Exec::Shell class fix 
*   2.0.3 Adding *Exec* namespece containing example classes
*   2.0.2 Increased code quality
*   2.0.1 Minor code improvements, add TravisCI
*   2.0.0 Gem has been written from scratch, all external dependencies removed  
*   1.0.0 converted to gem, option to choose um/coamps diagrams separetely and merge multiple diagrams with location labeling
*   0.2.0 Custom city selection, code reorganization
*   0.1.0 Initial version, fetches diagrams for Warsaw only. Tested on Ubuntu 12.04 LTS.

### Contributing to meteo_pl
*  Fork the project.
*  Start a feature/bugfix branch.
*  Submit pull request

### Copyright

Copyright (c) 2014-2017 Marcin Kot. See LICENSE.txt for
further details.
