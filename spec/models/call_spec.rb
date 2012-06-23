require 'spec_helper'

describe Call do
  describe "validations" do
    it { should validate_length_of(:number, maximum: 11, minimum: 11) }
  end

  describe "#make_call" do
    let(:client) { double(:client) }
    let(:call) { double(:call) }

    before do
      Twilio::REST::Client.should_receive(:new).and_return(client)
      client.stub_chain(:account,:calls,:create).and_return(call)
    end

    it "should make a phone call" do
      call_object = Call.create(number:"18005554444")
      call_object.make_call.should == call
    end
  end
end

