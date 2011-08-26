require 'spec_helper'
describe EmailExtractor::Parser::Xlsx do
  it "is subclass of EmailExtractor::Parser::Xls" do
     EmailExtractor::Parser::Xlsx.new("foo/bar").should be_a EmailExtractor::Parser::Xls
  end

  describe "#parse" do
    it "retreives emails from an xlsx spreadsheet" do
      parser = EmailExtractor::Parser::Xlsx.new("spec/fixtures/new-format.xlsx")
      parser.parse
      parser.emails.should eql(["markus.nordin@mynewsdesk.com", "markus@hej.se", "sven@bertil.se", "Adam.A@hotmail.com", "apa@elabs.se", "liam@neeson.net", "david@mynewsdesk.com"])
    end
  end
end
