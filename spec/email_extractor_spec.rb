require 'spec_helper'

describe EmailExtractor do
  describe ".parse" do
    it "should raise error if no file path is passed" do
      lambda{
        EmailExtractor.parse
      }.should raise_exception(ArgumentError)
    end

    it "should raise error if file is unsupported" do
      lambda {
        EmailExtractor.parse("foo.bar")
      }.should raise_error(EmailExtractor::InvalidFile)
    end

    it "should not raise error if a file path is passed" do
      lambda{
        EmailExtractor.parse("/file/path")
      }.should_not raise_exception(ArgumentError)
    end

    it "accepts an option file name and returns correct parser" do
      EmailExtractor::Parser::Xls.any_instance.stub(:parse)
      EmailExtractor.parse("/file/path", "apa.xls").should be_a EmailExtractor::Parser::Xls
    end

    it "should recognize a xls file and return correct parser" do
      path = "/foo/apa.xls"
      EmailExtractor::Parser::Xls.any_instance.stub(:parse)
      EmailExtractor.parse(path).should be_a EmailExtractor::Parser::Xls
    end

    it "should recognize a xlsx file and return correct parser" do
      path = "/foo/apa.xlsx"
      EmailExtractor::Parser::Xlsx.any_instance.stub(:parse)
      EmailExtractor.parse(path).should be_a EmailExtractor::Parser::Xlsx
    end

    it "should invoke parse method on the parser" do
      EmailExtractor::Parser::Xlsx.any_instance.should_receive(:parse)
      EmailExtractor.parse("/foo/bar.xlsx")
    end
  end
end
