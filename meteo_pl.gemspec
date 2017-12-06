# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name          = 'meteo_pl'
  s.version       = '2.0.0'
  s.date          = '2017-12-06'
  s.description   = "Fetches and manipulates on weather forecast graphs from http://www.meteo.pl service"
  s.authors       = ["Marcin Kot"]
  s.email         = 'marcin@kotu.pl'
  s.files         = ["lib/meteo_pl.rb"]
  s.license       = 'MIT'
  s.homepage      = "http://github.com/kotu-pl/meteo_pl"
  s.licenses      = ["MIT"]
  s.require_paths = ["lib"]
  s.summary       = "Weather forecast from http://www.meteo.pl"

  s.add_development_dependency 'rspec', '~> 3.6'
end
