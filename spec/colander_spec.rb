require 'spec_helper'

describe Colander do
  describe ".parse" do
    it "should raise error if no file path is passed" do
      lambda{
        Colander.parse
      }.should raise_exception(ArgumentError)
    end

    it "should raise error if file is unsupported" do
      lambda {
        Colander.parse("foo.bar")
      }.should raise_error(Colander::InvalidFile)
    end

    it "should not raise error if a file path is passed" do
      lambda{
        Colander.parse("/file/path")
      }.should_not raise_exception(ArgumentError)
    end

    it "accepts an option file name and returns correct parser" do
      Colander::Parser::Xls.any_instance.stub(:parse)
      Colander.parse("/file/path", "apa.xls").should be_a Colander::Parser::Xls
    end

    it "should recognize a xls file and return correct parser" do
      path = "/foo/apa.xls"
      Colander::Parser::Xls.any_instance.stub(:parse)
      Colander.parse(path).should be_a Colander::Parser::Xls
    end

    it "should recognize a xlsx file and return correct parser" do
      path = "/foo/apa.xlsx"
      Colander::Parser::Xlsx.any_instance.stub(:parse)
      Colander.parse(path).should be_a Colander::Parser::Xlsx
    end

    it "should invoke parse method on the parser" do
      Colander::Parser::Xlsx.any_instance.should_receive(:parse)
      Colander.parse("/foo/bar.xlsx")
    end
  end
end
