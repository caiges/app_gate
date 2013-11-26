# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'app_gate/version'

Gem::Specification.new do |spec|
  spec.name          = "app_gate"
  spec.version       = AppGate::VERSION
  spec.authors       = ["Caige Nichols"]
  spec.email         = ["caige.nichols@traxtech.com"]
  spec.description   = %q{Validates application or service as being trusted.}
  spec.summary       = %q{Validates that application or service ID is in the verified list of trusted apps.}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rack"
  spec.add_development_dependency "rack-test"
  spec.add_development_dependency "yard"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "mocha"
  spec.add_development_dependency "sinatra"
end
