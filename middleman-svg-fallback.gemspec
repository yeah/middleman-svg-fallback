# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "middleman-svg-fallback/version"

Gem::Specification.new do |s|
  s.name        = "middleman-svg-fallback"
  s.version     = Middleman::SVGFallback::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Jan Schulz-Hofen"]
  s.email       = ["jan@launchco.com"]
  s.homepage    = "https://github.com/yeah/middleman-svg-fallback"
  s.summary     = %q{Generate nice JPEG and PNG files from any SVG files.}
  s.description = s.summary

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.require_paths = ["lib"]

  s.add_runtime_dependency("middleman", [">= 3.0.0"])
  s.add_runtime_dependency("rake", [">= 0"])
end
