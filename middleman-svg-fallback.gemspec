$:.push File.expand_path("../lib", __FILE__)

Gem::Specification.new do |s|
  s.name        = "middleman-svg-fallback"
  s.version     = "0.1.1"
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Jan Schulz-Hofen"]
  s.email       = ["jan@launchco.com"]
  s.homepage    = "https://github.com/planio-gmbh/middleman-svg-fallback"
  s.summary     = %q{Generate nice JPEG and PNG files from any SVG files.}
  s.description = s.summary
  s.license = "MIT"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.require_paths = ["lib"]

  s.add_runtime_dependency("middleman-core", "~> 4.2")

  s.add_development_dependency("aruba")
  s.add_development_dependency("bundler")
  s.add_development_dependency("capybara")
  s.add_development_dependency("cucumber")
  s.add_development_dependency("middleman-cli")
  s.add_development_dependency("rake")
end
