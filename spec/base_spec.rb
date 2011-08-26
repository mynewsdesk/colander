require 'spec_helper'

describe EmailExtractor::Parser::Base do
  describe "#emails" do
    it "should responses to it" do
      EmailExtractor::Parser::Base.any_instance.stub(:parse)
      EmailExtractor::Parser::Base.new("foo/bar").should respond_to :emails
    end
  end
end
