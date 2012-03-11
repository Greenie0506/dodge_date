require 'spec_helper'

describe Call do
  describe ".initialize" do
    it "should save the number" do
      call = Call.new("18605554444")
      call.number.should == "18605554444"
    end
  end

  describe "#make_call" do
    let(:client) { double(:client) }
    let(:call) { double(:call) }

    before do
      Twilio::REST::Client.should_receive(:new).and_return(client)
      client.stub_chain(:account,:calls,:create).and_return(call)
    end

    it "should make a phone call" do
      call_object = Call.new("18005554444")
      call_object.make_call.should == call
    end
  end
end

