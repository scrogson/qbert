# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'qbert/version'

Gem::Specification.new do |spec|
  spec.name          = "qbert"
  spec.version       = Qbert::VERSION
  spec.authors       = ["Sonny Scroggin"]
  spec.email         = ["scrogson@gmail.com"]
  spec.summary       = "Qbert - A Basic Queue"
  spec.description   = "Qbert is a queue, a very basic queue."
  spec.homepage      = "https://github.com/scrogson/qbert"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
