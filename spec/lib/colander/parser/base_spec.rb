require 'spec_helper'

describe Colander::Parser::Base do
  let(:parser){ Colander::Parser::Base.new('foo/bar') }

  describe "#emails" do
    it "responds to email" do
      expect(Colander::Parser::Base.new("foo/bar")).to respond_to :emails
    end

    it "caches the result" do
      expect(parser).to receive(:collect_emails).exactly(:once){ [] }
      2.times { parser.emails }
    end

    sample_dir = File.join(FIXTURES_DIR, "samples")
    Dir.entries(sample_dir).each do |file_name|
      sample = File.join(sample_dir, file_name)
      next unless File.file?(sample)
      it "is able to parse the sample #{file_name}" do
        expect(Colander.open(sample).emails).to be_an(Array)
      end
    end
  end
end
