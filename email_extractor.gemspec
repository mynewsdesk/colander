# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "email_extractor/version"

Gem::Specification.new do |s|
  s.name        = "email_extractor"
  s.version     = EmailExtractor::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Kristian Hellquist", "Jonas Forsberg"]
  s.email       = ["dev@mynewsdesk.com"]
  s.homepage    = "http://devcorner.mynewsdesk.com"
  s.summary     = %q{Exctract a array of emails from various file formats}
  s.description = %q{See summary. lol}

  # s.rubyforge_project = "mnd_email_extractor"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_development_dependency "rspec"
end
