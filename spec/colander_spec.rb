require 'spec_helper'

describe Colander do
  describe ".parse" do
    it "raises error if no file path is passed" do
      expect {
        Colander.parse
      }.to raise_error
    end

    it "raises error if the file couldn't be found" do
      expect {
        Colander.parse("/path/to/hell.csv")
      }.to raise_error
    end

    it "raises error if file is unsupported" do
      expect {
        Colander.parse("foo.bar")
      }.to raise_error
    end

    it "does not raise error if a file path is passed" do
      expect {
        Colander.parse("spec/fixtures/plain.csv")
      }.to_not raise_error
    end

    it "accepts an option file name and returns correct parser" do
      expect(Colander.parse("spec/fixtures/new-format.xlsx")).to be_a Colander::Parser::Xls
    end

    it "recognizes a xls file and return correct parser" do
      path = "spec/fixtures/new-format.xlsx"
      expect(Colander.parse(path)).to be_a Colander::Parser::Xls
    end

    it "recognizes a xlsx file and return correct parser" do
      path = "/foo/apa.xlsx"
      allow_any_instance_of(Colander::Parser::Xlsx).to receive(:parse)
      expect(Colander.parse(path)).to be_a Colander::Parser::Xlsx
    end

    it "invokes parse method on the parser" do
      expect_any_instance_of(Colander::Parser::Xlsx).to receive(:parse)
      Colander.parse("/foo/apa.xlsx")
    end
  end
end
