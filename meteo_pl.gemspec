require File.expand_path('../lib/meteo_pl/version', __FILE__)

Gem::Specification.new do |spec|
  spec.name          = 'meteo_pl'
  spec.version       = MeteoPl::VERSION
  spec.summary       = "Weather forecast from http://www.meteo.pl"
  spec.description   = "Fetches and manipulates on weather forecast graphs from http://www.meteo.pl service"
  spec.license       = 'MIT'
  spec.authors       = ["Marcin Kot"]
  spec.email         = 'marcin@kotu.pl'
  spec.homepage      = "http://github.com/kotu-pl/meteo_pl"

  spec.files         = `git ls-files`.split("\n")
  spec.test_files    = spec.files.grep(/^spec\//)
  spec.require_paths = ["lib"]

  spec.add_development_dependency 'rspec', '~> 3.6'
  spec.add_development_dependency 'webmock', '~> 3.1'
  spec.add_development_dependency 'rake', '~> 12.1'

  spec.required_ruby_version = '>= 2.0'
end
