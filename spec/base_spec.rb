require 'spec_helper'

describe Colander::Parser::Base do
  describe "#emails" do
    it "should responses to it" do
      Colander::Parser::Base.any_instance.stub(:parse)
      Colander::Parser::Base.new("foo/bar").should respond_to :emails
    end
  end
end
