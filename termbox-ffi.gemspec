# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'termbox/version'

Gem::Specification.new do |spec|
  spec.name          = 'termbox-ffi'
  spec.version       = Termbox::VERSION
  spec.authors       = ["Ashley Towns"]
  spec.email         = ["ashleyis@me.com"]
  spec.summary       = %q{FFI wrapper around Termbox}
  spec.description   = %q{FFI wrapper around Termbox, includes the C library}
  spec.homepage      = 'https://github.com/aktowns/termbox-ffi'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0") + Dir[File.join('ext', '**', '*')]
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']
  spec.extensions = %w[ext/extconf.rb]

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"

  spec.add_dependency 'ffi', '~> 1.9'
end
