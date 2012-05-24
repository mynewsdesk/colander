require 'spec_helper'
describe Colander::Parser::Plain do

  describe "#parse" do
    it "retreives emails from an csv file" do
      parser = Colander::Parser::Plain.new("spec/fixtures/plain.csv")
      parser.parse
      parser.emails.sort.should eql(["jonas.forsberg@mynewsdesk.com", "peter.forsberg@xhockeypro.com"].sort)
    end

    it "retreives emails from an txt file" do
      parser = Colander::Parser::Plain.new("spec/fixtures/text.txt")
      parser.parse
      parser.emails.sort.should eql(["jonas.forsberg@mynewsdesk.com", "kristian.hellquist@mynewsdesk.com", "richard@mynewsdesk.com"].sort)
    end

  end
end
