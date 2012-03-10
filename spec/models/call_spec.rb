require 'spec_helper'

describe Call do
  describe ".initialize" do
    it "should save the number" do
      call = Call.new("18605554444")
      call.number.should == "18605554444"
    end
  end
end
