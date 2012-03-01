require 'spec_helper'

describe Colander::Parser::Xls do
  describe "#parse" do
    it "stores found emails" do
      Excel.stub(:new)
      parser = Colander::Parser::Xls.new("file/path")
      parser.should_receive(:collect_emails).and_return(["bruce@wayne.com"])
      parser.parse
      parser.emails.sort.should eql(["bruce@wayne.com"])
    end

    it "raises exception if file is invalid" do
      parser = Colander::Parser::Xls.new("./#{__FILE__}")
      lambda {
        parser.parse
      }.should raise_error(Colander::InvalidFile)
    end

    it "wraps errors and returns InvalidFile" do
      parser = Colander::Parser::Xls.new("file/path")
      parser.should_receive(:parse_file).and_raise(RuntimeError.new("FUUU"))
      expect {
        parser.parse
      }.to raise_error(Colander::InvalidFile)
    end

    it "retreives emails from an 95-excel spreadsheet" do
      pending "handle encoding error"
      parser = Colander::Parser::Xls.new("spec/fixtures/excel95.xls")
      parser.parse
      parser.emails.should eql(["markus.nordin@mynewsdesk.com", "markus@hej.se", "sven@bertil.se", "Adam.A@hotmail.com", "apa@elabs.se", "liam@neeson.net", "david@mynewsdesk.com"])
    end
    it "retreives emails from an xls spreadsheet" do
      parser = Colander::Parser::Xls.new("spec/fixtures/old-format.xls")
      parser.parse
      parser.emails.should eql(["markus.nordin@mynewsdesk.com", "markus@hej.se", "sven@bertil.se", "Adam.A@hotmail.com", "apa@elabs.se", "liam@neeson.net", "david@mynewsdesk.com"])
    end
    it "retreives emails from an 95-excel spreadsheet without file suffix" do
      pending "handle encoding error"
      parser = Colander::Parser::Xls.new("spec/fixtures/excel95-without-file-suffix")
      parser.parse
      parser.emails.should eql(["markus.nordin@mynewsdesk.com", "markus@hej.se", "sven@bertil.se", "Adam.A@hotmail.com", "apa@elabs.se", "liam@neeson.net", "david@mynewsdesk.com"])
    end
  end
end
