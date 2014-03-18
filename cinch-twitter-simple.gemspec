# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'cinch/twitter/simple/version'

Gem::Specification.new do |spec|
  spec.name          = "cinch-twitter-simple"
  spec.version       = Cinch::Twitter::Simple::VERSION
  spec.authors       = ["Matt Zorn"]
  spec.email         = ["zornme@gmail.com"]
  spec.description   = %q{Cinch IRC bot plugin that watches chat for tweet urls and responds to them with the tweet's text.}
  spec.summary       = %q{Simple Cinch IRC bot plugin}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
