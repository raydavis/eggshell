require 'json'

module Api
  class UserApi < Sinatra::Base
    root = "/api/user"

    get "#{root}/status" do
      user = User.new(session[:user_id])
      if session[:user_id]
        {
          :isLoggedIn => true,
          :preferredName => user.preferred_name || "",
          :uid => session[:user_id],
          :widgetData => {}
        }.to_json
      else
        {
          :isLoggedIn => false
        }.to_json
      end
    end

    get "#{root}/:uid" do
      user = User.new(params[:uid])
      {
        :uid => params[:uid],
        :preferredName =>  user.preferred_name || ""
      }.to_json
    end

  end
end
