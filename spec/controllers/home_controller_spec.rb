require 'spec_helper'

describe HomeController do
  describe "index" do
    it "should load successfully" do
      get "index"
      response.should be_success
    end
  end

  describe "call_me" do
    it "should instantiate a new call" do
      post :call_me, {number: "18602686902"}

      call = assigns :call
      call.should be
      call.number.should == "18602686902"
    end
  end
end
