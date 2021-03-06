# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'circa/version'

Gem::Specification.new do |spec|
  spec.name          = "circa"
  spec.version       = Circa::VERSION
  spec.authors       = ["Robert Dallas Gray"]
  spec.email         = ["robert.dallas.gray@huzutech.com"]
  spec.description   = %q{TODO: Write a gem description}
  spec.summary       = %q{TODO: Write a gem summary}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "m", "~> 1.3.1"
  spec.add_development_dependency "guard", ">= 1.8"
  spec.add_development_dependency "guard-minitest"
end
