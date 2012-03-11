class Call
  attr_accessor :number


  def initialize(number)
    @number = number
  end

  def make_call
    account_sid = ENV['TWILIO_SID']
    auth_token = ENV['TWILIO_TOKEN']

    @client = Twilio::REST::Client.new account_sid, auth_token

    @call = @client.account.calls.create(
      :from => '+18607864737',
      :to => "+#{number}",
      :url => 'http://demo.twilio.com/welcome/call'
    )
  end
end
