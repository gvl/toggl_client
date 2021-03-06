# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'toggl_client/version'

Gem::Specification.new do |spec|
  spec.name          = 'toggl_client'
  spec.version       = Toggl::VERSION
  spec.authors       = ['Igor Dominiak']
  spec.email         = ['dominiak.igor@gmail.com']
  spec.summary       = %q{Toggl ruby client}
  spec.description   = %q{Toggl ruby client}
  spec.homepage      = ''
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_dependency 'faraday'
  spec.add_dependency 'oj'

  spec.add_development_dependency 'bundler', '~> 1.6'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'rspec'
  spec.add_development_dependency 'coveralls'
end
