require 'spec_helper'

describe Colander do
  describe ".parse" do
    it "should raise error if no file path is passed" do
      expect {
        Colander.parse
      }.to raise_error
    end

    it "should raise error if file is unsupported" do
      expect {
        Colander.parse("foo.bar")
      }.to raise_error
    end

    it "should not raise error if a file path is passed" do
      expect {
        Colander.parse("/file/path.csv")
      }.to_not raise_error
    end

    it "accepts an option file name and returns correct parser" do
      Colander::Parser::Xls.any_instance.stub(:parse)
      expect(Colander.parse("/file/path", "apa.xls")).to be_a Colander::Parser::Xls
    end

    it "should recognize a xls file and return correct parser" do
      path = "/foo/apa.xls"
      Colander::Parser::Xls.any_instance.stub(:parse)
      expect(Colander.parse(path)).to be_a Colander::Parser::Xls
    end

    it "should recognize a xlsx file and return correct parser" do
      path = "/foo/apa.xlsx"
      Colander::Parser::Xlsx.any_instance.stub(:parse)
      expect(Colander.parse(path)).to be_a Colander::Parser::Xlsx
    end

    it "should invoke parse method on the parser" do
      expect_any_instance_of(Colander::Parser::Xlsx).to receive(:parse)
      Colander.parse("/foo/bar.xlsx")
    end
  end
end
