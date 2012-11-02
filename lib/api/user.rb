require 'json'
require 'rest-client'

module Api
  class User < Sinatra::Base
    root = "/api/user"

    get "#{root}/status" do
      if session[:user_id]
        {
          :logged_in => true,
          :uid => session[:user_id]
        }.to_json
      else
        {
          :logged_in => false
        }.to_json
      end
    end

    get "#{root}/:uid" do
      #eventually check db for existance of uid, etc.
      {
        :uid => params[:uid],
        :widget_data => {}
      }.to_json
    end

  end
end