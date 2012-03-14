class Call < ActiveRecord::Base
  attr_accessor :number

  CALL_TIMES = {
    "Now" => Time.now,
    "Half hour" => Time.now + 30,
    "Hour" => Time.now + 60,
    "Hour and a half" => Time.now + 90,
    "Two hours" => Time.now + 120
  }

  def initialize(number)
    number.gsub!("\D", "")
    number = ("1" + number)

    if number.size == 11
      @number = number
    else
      raise Exception.new("Not a valid number")
    end
  end

  def make_call
    account_sid = ENV['TWILIO_SID']
    auth_token = ENV['TWILIO_TOKEN']

    @client = Twilio::REST::Client.new account_sid, auth_token

    @call = @client.account.calls.create(
      :from => '+18607864737',
      :to => "+#{number}",
      :url =>  'http://www.dodgedate.com/voice'
    )
  end
end

