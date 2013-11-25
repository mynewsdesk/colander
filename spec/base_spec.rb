require 'spec_helper'

describe Colander::Parser::Base do
  describe "#emails" do
    it "should responses to it" do
      Colander::Parser::Base.any_instance.stub(:parse)
      expect(Colander::Parser::Base.new("foo/bar")).to respond_to :emails
    end
  end

  describe ".parse" do
    sample_dir = File.join(File.dirname(File.expand_path(__FILE__)), "fixtures", "samples")
    Dir.entries(sample_dir).each do |file_name|
      sample = File.join(sample_dir, file_name)
      next unless File.file?(sample)
      it "should be able to parse the sample #{file_name}" do
        expect(Colander.parse(sample).emails).to be_an(Array)
      end
    end
  end
end
