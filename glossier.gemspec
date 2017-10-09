# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "glossier/version"

Gem::Specification.new do |spec|
  spec.name          = "glossier"
  spec.version       = Glossier::VERSION
  spec.executables   = ["glossier"]
  spec.authors       = ["<lauraszyms>"]
  spec.email         = ["<lauraszyms@gmail.com>"]

  spec.summary       = "Glossier CLI App"
  spec.description   =  ["lib/glossier"]
  spec.homepage      = "https://github.com/lauraszyms/glossier-cli-app"
  spec.license       = "MIT"
  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.require_paths = ["lib", "lib/glossier"]

  spec.add_development_dependency "bundler", "~> 1.15"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
