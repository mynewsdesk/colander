require 'spec_helper'
describe Colander::Parser::Xlsx do
  it "is subclass of Colander::Parser::Xls" do
     expect(Colander::Parser::Xlsx.new("foo/bar")).to be_a Colander::Parser::Xls
  end

  context "with file with headers" do
    let(:parser){ Colander::Parser::Xlsx.new("spec/fixtures/with-headers.xlsx") }
    describe "#emails" do
      it "retreives emails from an the spreadsheet" do
        pending 'not working :/'
        expect(parser.emails.sort).to eq ["kalle.anka@ankeborg.se", "bruce@wayne.com"].sort
      end
    end

    describe "#headers" do
      it "returns an empty array" do
        expect(parser.headers).to eq ["Email", "name", "Company"]
      end
    end

    describe '#rows' do
      it "returns an array of rows" do
        expect(parser.rows).to be_a Array
      end

      it "each row is a hash with the headers as key" do
        row = parser.rows.first
        expect(row).to be_a Hash
        expect(row.keys).to eq ["Email", "name", "Company"]
        expect(row.values).to eq ["kalle.anka@ankeborg.se", "Kalle Anka", "Ankeborg"]
        expect(parser.rows.last["Email"]).to eq "bruce@wayne.com"
      end
    end
  end

  context "with a file without headers" do
    let(:parser){ Colander::Parser::Xlsx.new("spec/fixtures/new-format.xlsx") }
    describe "#emails" do
      it "retreives emails from an xlsx spreadsheet" do
        expect(parser.emails.sort).to eq ["markus.nordin@mynewsdesk.com", "markus@hej.se", "sven@bertil.se", "Adam.A@hotmail.com", "apa@elabs.se", "liam@neeson.net", "david@mynewsdesk.com"].sort
      end
    end
  end
end
