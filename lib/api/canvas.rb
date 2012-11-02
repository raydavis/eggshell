require 'json'
require 'rest-client'

module Api
  class Canvas < Sinatra::Base
    root = "/api/canvas"

    before "#{root}/protected" do
      redirect to('/login') unless session[:user_id]
    end

    # courses bound to some user's specific api key.
    get "#{root}/mycourses" do
      if Settings.canvas_proxy.fake
        p "Canvas proxy is in fake mode"
        Api::Fake.read_json %w(canvas mycourses)
      else
        RestClient.get("#{Settings.canvas_proxy.canvas_root}/api/v1/courses",
                       {
                           :Authorization => "Bearer #{Settings.canvas_proxy.admin_access_token}"
                       })
      end
    end

  end
end
