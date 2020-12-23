class TwilioTextMessenger
  attr_reader :message

  def initialize(message)
    @message = message
  end

  def send(to)
    client = Twilio::REST::Client.new
    client.messages.create({
      from: ENV['TWILIO_PHONE_NUMBER'],
      to: to,
      body: message
    })
  end
end