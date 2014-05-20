require 'spec_helper'

describe Colander::Parser::Xls do
  describe "#emails" do
    it "stores found emails" do
      parser = Colander::Parser::Xls.new("file/path")
      expect(parser).to receive(:parse_file).and_return("bruce@wayne.com")
      expect(parser.emails.sort).to eq ["bruce@wayne.com"]
    end

    it "raises exception if file is invalid" do
      parser = Colander::Parser::Xls.new("./#{__FILE__}")
      expect {
        parser.emails
      }.to raise_error
    end

    it "wraps errors and returns InvalidFile" do
      parser = Colander::Parser::Xls.new("file/path")
      expect(parser).to receive(:parse_file).and_raise(RuntimeError.new("FUUU"))
      expect {
        parser.emails
      }.to raise_error
    end

    context "with a 95-excel spreadsheet without headers" do
      let(:parser){ Colander::Parser::Xls.new("spec/fixtures/excel95.xls") }
      describe "#emails" do
        it "retreives emails from an the spreadsheet" do
          expect(parser.emails.sort).to eq ["markus.nordin@mynewsdesk.com", "markus@hej.se", "sven@bertil.se", "Adam.A@hotmail.com", "apa@elabs.se", "liam@neeson.net", "david@mynewsdesk.com"].sort
        end
      end

      describe "#headers" do
        it "returns an empty array" do
          expect(parser.headers).to eq []
        end
      end
    end

    context "with a xls excel spreadsheet" do
      let(:parser){ Colander::Parser::Xls.new("spec/fixtures/old-format.xls") }
      describe "#emails" do
        it "retreives emails from an the spreadsheet" do
          expect(parser.emails.sort).to eq ["markus.nordin@mynewsdesk.com", "markus@hej.se", "sven@bertil.se", "Adam.A@hotmail.com", "apa@elabs.se", "liam@neeson.net", "david@mynewsdesk.com"].sort
        end
      end
    end

    context "with a 95-excel spreadsheet without file suffix" do
      let(:parser){ Colander::Parser::Xls.new("spec/fixtures/excel95-without-file-suffix") }
      describe "#emails" do
        it "retreives emails from the spreadsheet" do
          expect(parser.emails.sort).to eq ["markus.nordin@mynewsdesk.com", "markus@hej.se", "sven@bertil.se", "Adam.A@hotmail.com", "apa@elabs.se", "liam@neeson.net", "david@mynewsdesk.com"].sort
        end
      end
    end
  end
end
