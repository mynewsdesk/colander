# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "colander/version"

Gem::Specification.new do |s|
  s.name        = "colander"
  s.version     = Colander::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Kristian Hellquist", "Jonas Forsberg"]
  s.email       = ["dev@mynewsdesk.com"]
  s.homepage    = "http://devcorner.mynewsdesk.com"
  s.summary     = %q{Exctract an array of emails from various file formats}
  s.description = %q{Exctract an array of emails from various file formats (xls, xlsx)}

  # s.rubyforge_project = "mnd_colander"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_dependency "roo", "~> 1.10.1"
  s.add_dependency "zip", "~> 2.0.2"
  s.add_development_dependency "rspec"
end
