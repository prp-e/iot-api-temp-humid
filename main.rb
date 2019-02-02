require 'sinatra' 
require 'mongoid' 
require 'json'
require 'digest'

set :bind, '0.0.0.0'

configure do 
   Mongoid.load!("./database.yml") 
end

enable :sessions 

class User 
    include Mongoid::Document 

    field :username, type: String 
    field :password, type: String 
    field :email,    type: String 

end 

class Environment 
    include Mongoid::Document 

    field :temperature, type: String 
    field :humidity, type: String 

end

helpers do 
    def login? 
        if session[:username].nil? 
            return false 
        else 
            return true 
        end 
    end
end

def username 
    return session[:username]
end

post '/signup/:username/:password/:email' do 
    begin
        user = User.create(:username => params[:username], :password => Digest::MD5.hexdigest(params[:password]), :email => params[:email])
        'Done successfuly\n'
    rescue
        'Signup unsuccesful'
    end
end

post '/env/:temperature/:humidity' do 

    if session[:username].nil? 
        'login required'
    else 
        env = Environment.create(:temperature => params[:temperature], :humidity => params[:humidity])
    end
end