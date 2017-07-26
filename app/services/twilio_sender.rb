require 'twilio-ruby'

class TwilioSender

  def self.send(to = '+1 4434873264')
    account_sid = ENV['TWILIO_ACCOUNT_SID'] # Your Account SID from www.twilio.com/console
    auth_token = ENV['TWILIO_AUTH_TOKEN']
    confirmation_code = CodeGenerator.generate_code
    @client = Twilio::REST::Client.new(account_sid, auth_token)
    message = @client.messages.create(:body => "#{confirmation_code}",
    :to => '+1 4434873264',    # Replace with your phone number
    :from => '+ 14432724373')  # Replace with your Twilio number
    confirmation_code
  end
end
