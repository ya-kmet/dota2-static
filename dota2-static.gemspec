# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'dota2/static/version'

Gem::Specification.new do |spec|
  spec.name          = 'dota2-static'
  spec.version       = Dota2::Static::VERSION
  spec.authors       = ['yana kmiet']
  spec.email         = ['jana.kmet@gmail.com']

  spec.summary       = %q{Dota 2 static data.}
  spec.description   = %q{This gem provides Dota 2 static data and images.}
  spec.homepage      = 'https://github.com/godjo/dota2-static'

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(bin|spec)/}) }

  spec.require_paths = ['lib']

  spec.add_dependency 'rails', '>= 4', '< 5'
  spec.add_development_dependency 'bundler', '~> 1.10'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.1'
  spec.add_development_dependency 'rubocop', '~> 0.33.0'
end
