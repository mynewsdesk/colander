$:.push File.expand_path("../lib", __FILE__)

require 'colander'
require 'pry'

FIXTURES_DIR = File.join(File.dirname(File.expand_path(__FILE__)), "fixtures")

Dir["./spec/support/**/*.rb"].sort.each { |f| require f}
