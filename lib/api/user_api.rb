require 'json'

module Api
  class UserApi < Sinatra::Base
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
      user = User.new(params[:uid])

      {
        :uid => params[:uid],
        :preferred_name =>  user.preferred_name || "",
        :widget_data => {}
      }.to_json
    end

  end
end