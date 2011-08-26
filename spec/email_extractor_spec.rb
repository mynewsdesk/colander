require 'spec_helper'

describe EmailExtractor do
  describe ".parse" do
    it "should raise error if no file path is passed" do
      lambda{
        EmailExtractor.parse
      }.should raise_exception(ArgumentError)
    end

    it "should not raise error if a file path is passed" do
      lambda{
        EmailExtractor.parse("/file/path")
      }.should_not raise_exception(ArgumentError)
    end

    it "should recognize a xls file and return correct parser" do
      path = "/foo/apa.xls"
      EmailExtractor.parse(path).should be_a EmailExtractor::Parser::Xls
    end

    it "should recognize a xlsx file and return correct parser" do
      path = "/foo/apa.xlsx"
      EmailExtractor.parse(path).should be_a EmailExtractor::Parser::Xlsx
    end

    it "should invoke parse method on the parser" do
      EmailExtractor::Parser::Xlsx.any_instance.expects(:parse)
      EmailExtractor.parse("/foo/bar")
    end
  end
end
