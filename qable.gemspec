# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "qable/version"

Gem::Specification.new do |spec|
  spec.name          = "qable"
  spec.version       = Qable::VERSION
  spec.authors       = ["Guillermo Iguaran"]
  spec.email         = ["guilleiguaran@gmail.com"]
  spec.licenses         = ['MIT']
  spec.summary       = %q{Qable acceptance testing framework}
  spec.description   = %q{Qable acceptance testig framework based in Cucumber/Capybara}
  spec.homepage      = "https://github.com/ableco/qable"
  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "bundler", "~> 1.15"
  spec.add_dependency "rake", "~> 12"
  spec.add_dependency "minitest", "~> 5"
  spec.add_dependency "cucumber", "~> 3.0"
  spec.add_dependency "capybara", "~> 2.15"
  spec.add_dependency "selenium-webdriver", "~> 3.7"
  spec.add_dependency "capybara-screenshot", "~> 1.0"
end
