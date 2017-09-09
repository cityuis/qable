# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "qable/cucumber/version"

Gem::Specification.new do |spec|
  spec.name          = "qable-cucumber"
  spec.version       = Qable::Cucumber::VERSION
  spec.authors       = ["Guillermo Iguaran"]
  spec.email         = ["guilleiguaran@gmail.com"]

  spec.summary       = %q{Qable Cucumber framework}
  spec.description   = %q{Qable Cucumber framework for QA}
  spec.homepage      = "https://github.com/ableco/qable-cucumber"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "bundler"
  spec.add_dependency "rake"
  spec.add_dependency "minitest"
  spec.add_dependency "cucumber"
  spec.add_dependency "capybara"
  spec.add_dependency "selenium-webdriver"
end
