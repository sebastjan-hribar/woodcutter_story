# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'woodcutter_story/version'

Gem::Specification.new do |spec|
  spec.name          = "woodcutter_story"
  spec.version       = WoodcutterStory::VERSION
  spec.authors       = ["Sebastjan Hribar"]
  spec.email         = ["sebastjan.hribar@gmail.com"]

  spec.summary       = %q{Decision driven story in Slovenian.}
  spec.description   = %q{}
  spec.homepage      = "https://github.com/sebastjan-hribar/woodcutter_story"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org by setting 'allowed_push_host', or
  # delete this section to allow pushing this gem to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "TODO: Set to 'http://rubygems.org'"
  else
    raise "RubyGems 2.0 or newer is required to protect against public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.executables   = ["woodcutter"]
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "green_shoes", "=1.1.367"

  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "minitest"
end
