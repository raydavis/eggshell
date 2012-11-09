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
      user = CampusData.get_person_attributes(params[:uid])
      if user.nil?
        empty_response = ""
      end
      {
        :uid => params[:uid],
        :first_name => empty_response || user["first_name"],
        :last_name => empty_response || user["last_name"],
        :widget_data => {}
      }.to_json
    end

  end
end