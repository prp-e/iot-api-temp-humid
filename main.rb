require 'sinatra' 
require 'mongoid' 
require 'json'
require 'digest'

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

