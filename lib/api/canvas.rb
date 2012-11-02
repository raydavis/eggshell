require 'json'
require 'rest-client'

module Api
  class Canvas < Sinatra::Base
    root = "/api/canvas"
    fake_root = "/fake#{root}"

    before "#{root}/protected" do
      redirect to('/login') unless session[:user_id]
    end

    # courses bound to some user's specific api key.
    get "#{root}/mycourses" do
      if Settings.canvas_proxy.fake
        p "Canvas proxy is in fake mode"
        mycourses_fake
      else
        RestClient.get("#{Settings.canvas_proxy.canvas_root}/api/v1/courses",
                       {
                           :Authorization => "Bearer #{Settings.canvas_proxy.admin_access_token}"
                       })
      end
    end

    get "#{fake_root}/mycourses" do
      mycourses_fake
    end

    def mycourses_fake
      File.read(File.join(File.dirname(__FILE__), '..', 'fake_data/canvas_mycourses.json' ))
    end

  end
end