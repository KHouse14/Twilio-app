require 'rubygems' # not necessary with ruby 1.9 but included for completeness
require 'twilio-ruby'

# put your own credentials here
account_sid = 'AC11e4d72fd7a5f7baf632f83d1a6fb207'
auth_token = '5a378de9411924aa3fd7f39eec094914'

# set up a client to talk to the Twilio REST API
@client = Twilio::REST::Client.new account_sid, auth_token

# alternatively, you can preconfigure the client like so
@client.messages.create(
  from: '+14803591614',
  to: '+16023176968',
  body: 'Hey there Karsten ;)'
)