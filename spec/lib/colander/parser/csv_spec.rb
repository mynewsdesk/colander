require 'spec_helper'
describe Colander::Parser::Csv do
  let(:parser){ Colander::Parser::Csv.new("spec/fixtures/plain.csv") }

  context "with file with headers" do
    let(:file_with_headers){ "spec/fixtures/plain.csv" }
    let(:headers){ ['name', ' email', ' phone'] }
    let(:emails){ ["kalle.anka@ankeborg.se", "bruce@wayne.com"] }
    let(:first_row_values){ ["Jonas", " jonas.forsberg@mynewsdesk.com", " +460011234567"] }

    it_behaves_like "a spreadsheet parser"
  end

  describe "#emails" do
    it "retreives emails from an csv file" do
      expect(parser.emails.sort).to eq ["jonas.forsberg@mynewsdesk.com", "alfred.pennyworth@gotham.travel", "peter.forsberg@xhockeypro.com"].sort
    end

    it 'supports top-level-domains of all sizes' do
      expect(parser.emails.sort).to eq ["jonas.forsberg@mynewsdesk.com", "alfred.pennyworth@gotham.travel", "peter.forsberg@xhockeypro.com"].sort
    end
  end

  describe "#headers" do
    it "returns an array of the headers" do
      expect(parser.headers).to eq ['name', ' email', ' phone']
    end
  end
end
