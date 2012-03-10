class Call
  attr_accessor :number

  def initialize(number)
    @number = number
    account_sid = 'AC9e1e2ba110ed47fe93a1ed39f2cefe36'
    auth_token = 'ad0527da74095782fd5111bc6e63ecb2'

    @client = Twilio::REST::Client.new account_sid, auth_token

    @call = @client.account.calls.create(
      :from => '+18607864737',
      :to => "+#{number}",
      :url => 'http://demo.twilio.com/welcome/call'
    )
  end
end
