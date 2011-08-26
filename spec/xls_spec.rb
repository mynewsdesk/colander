require 'spec_helper'

describe EmailExtractor::Parser::Xls do
  describe "#parse" do
    it "stores found emails" do
      Excel.stub(:new)
      parser = EmailExtractor::Parser::Xls.new("file/path")
      parser.should_receive(:collect_emails).and_return(["bruce@wayne.com"])
      parser.parse
      parser.emails.sort.should eql(["bruce@wayne.com"])
    end

    it "raises exception if file is invalid" do
      parser = EmailExtractor::Parser::Xls.new("./#{__FILE__}")
      lambda {
        parser.parse
      }.should raise_error("Invalid file")
    end

    it "retreives emails from an 95-excel spreadsheet" do
      parser = EmailExtractor::Parser::Xls.new("spec/fixtures/excel95.xls")
      parser.parse
      parser.emails.should eql(["markus.nordin@mynewsdesk.com", "markus@hej.se", "sven@bertil.se", "Adam.A@hotmail.com", "apa@elabs.se", "liam@neeson.net", "david@mynewsdesk.com"])
    end
    it "retreives emails from an xls spreadsheet" do
      parser = EmailExtractor::Parser::Xls.new("spec/fixtures/old-format.xls")
      parser.parse
      parser.emails.should eql(["markus.nordin@mynewsdesk.com", "markus@hej.se", "sven@bertil.se", "Adam.A@hotmail.com", "apa@elabs.se", "liam@neeson.net", "david@mynewsdesk.com"])
    end
  end
end
