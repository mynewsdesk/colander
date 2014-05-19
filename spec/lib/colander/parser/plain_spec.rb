require 'spec_helper'
describe Colander::Parser::Plain do

  describe "#emails" do
    it 'supports top-level-domains of all sizes' do
      parser = Colander::Parser::Plain.new("spec/fixtures/plain.csv")
      expect(parser.emails.sort).to eq ["jonas.forsberg@mynewsdesk.com", "alfred.pennyworth@gotham.travel", "peter.forsberg@xhockeypro.com"].sort
    end

    it "retreives emails from an txt file" do
      parser = Colander::Parser::Plain.new("spec/fixtures/text.txt")
      expect(parser.emails.sort).to eq ["jonas.forsberg@mynewsdesk.com", "kristian.hellquist@mynewsdesk.com", "richard@mynewsdesk.com"].sort
    end

  end
end
