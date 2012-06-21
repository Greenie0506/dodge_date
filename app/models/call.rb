class Call < ActiveRecord::Base

  CALL_TIMES = {
    "Now" => Time.now,
    "Half hour" => 30.minutes.from_now,
    "Hour" => 60.minutes.from_now,
    "Hour and a half" => 90.minutes.from_now,
    "Two hours" => 120.minutes.from_now
  }

  def new_call(number)
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

