require 'spec_helper'
describe Colander::Parser::Xlsx do
  it "is subclass of Colander::Parser::Xls" do
     expect(Colander::Parser::Xlsx.new("foo/bar")).to be_a Colander::Parser::Xls
  end

  context "with file with headers" do
    let(:file_with_headers){ "spec/fixtures/with-headers.xlsx" }
    let(:headers){ ["Email", "name", "Company"] }
    let(:emails){ ["kalle.anka@ankeborg.se", "bruce@wayne.com"] }
    let(:first_row_values){ ["kalle.anka@ankeborg.se", "Kalle Anka", "Ankeborg"] }

    it_behaves_like "a spreadsheet parser"
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
