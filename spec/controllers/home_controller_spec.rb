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
      post :call_me, {number: "8602686902"}

      call = assigns :call
      call.should be
      call.number.should == "18602686902"
    end
  end

  describe "voice" do
    it "should render a file and have the content type of txt/xml with no layout" do
      post :voice, :file => 'public/voice.txt', :content_type => 'txt/xml', :layout => false

      response.should be_success
    end
  end
end
