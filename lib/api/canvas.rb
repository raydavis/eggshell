require 'json'
require 'rest-client'

module Api

  class Canvas < Api::FakeableProxy
    root = "/api/canvas"

    def fake
      Settings.canvas_proxy.fake
    end

    before "#{root}/protected" do
      redirect to('/login') unless session[:user_id]
    end

    # courses bound to some user's specific api key.
    get "#{root}/mycourses" do
      make_request "canvas/mycourses" do
        RestClient.get("#{Settings.canvas_proxy.canvas_root}/api/v1/courses", {
            :Authorization => "Bearer #{Settings.canvas_proxy.admin_access_token}",
            :accept_encoding => ''
        })
      end
    end

    # TODO clean up this duplication in the rails-api scheme
    get "/fake#{root}/mycourses" do
      make_request("canvas/mycourses", true) do
        RestClient.get("#{Settings.canvas_proxy.canvas_root}/api/v1/courses", {
            :Authorization => "Bearer #{Settings.canvas_proxy.admin_access_token}",
            :accept_encoding => ''
        })
      end
    end

  end
end
