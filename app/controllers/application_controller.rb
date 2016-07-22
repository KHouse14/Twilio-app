require './config/environment'
require './app/models/model'


class ApplicationController < Sinatra::Base
# put your own credentials here
account_sid = 'AC11e4d72fd7a5f7baf632f83d1a6fb207'
auth_token = '5a378de9411924aa3fd7f39eec094914'
# this helps connect our public and views directories
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do 
    erb :status
  end
   get '/page2' do
    erb :page2
  end
  
  get '/infopage' do 
    erb :infopage
  end
   
  
  post '/page2' do
    @client = Twilio::REST::Client.new account_sid, auth_token
    @status1 = Status.new(params[:level])
    @client.messages.create(
      from: '+14803591614', 
      to: '+16023176968',
      body: "Hey there Karsten, the water bowl is #{@status1.level}!"
      )
    erb :page2
  end
  

end