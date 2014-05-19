require 'spec_helper'
describe Colander::Parser::Xlsx do
  it "is subclass of Colander::Parser::Xls" do
     expect(Colander::Parser::Xlsx.new("foo/bar")).to be_a Colander::Parser::Xls
  end

  describe "#parse" do
    it "retreives emails from an xlsx spreadsheet" do
      parser = Colander::Parser::Xlsx.new("spec/fixtures/new-format.xlsx")
      parser.parse
      expect(parser.emails.sort).to eq ["markus.nordin@mynewsdesk.com", "markus@hej.se", "sven@bertil.se", "Adam.A@hotmail.com", "apa@elabs.se", "liam@neeson.net", "david@mynewsdesk.com"].sort
    end
  end
end
