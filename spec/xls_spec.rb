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
  end
  describe "#emails" do
    it "should responses to it" do
      EmailExtractor::Parser::Base.any_instance.stub(:parse)
      EmailExtractor::Parser::Base.new("foo/bar").should respond_to :emails
    end
  end
end
