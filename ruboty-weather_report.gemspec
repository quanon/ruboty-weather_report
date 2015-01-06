# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'ruboty/weather_report/version'

Gem::Specification.new do |spec|
  spec.name          = 'ruboty-weather_report'
  spec.version       = Ruboty::WeatherReport::VERSION
  spec.authors       = ['QUANON']
  spec.email         = ['quanon86@gmail.com']
  spec.summary       = 'A Ruboty handler to show weather information'
  spec.homepage      = 'https://github.com/quanon/ruboty-weather_report'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.7'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_runtime_dependency 'ruboty'
end
