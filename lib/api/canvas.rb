require 'json'
require 'rest-client'

module Api
  class Canvas < Sinatra::Base
    root = "/api/canvas"

    before "#{root}/protected" do
      redirect to('/login') unless session[:user_id]
    end

    get "#{root}/hello" do
      return {
        :value => "This response came from your Sinatra application."
      }.to_json
    end

    #Something fancy: courses bound to some user's specific api key.'
    get "#{root}/mycourses" do
      response = RestClient.get("#{Settings.canvas_proxy.canvas_root}/api/v1/courses",
                                {
                                  :Authorization => "Bearer #{Settings.canvas_proxy.admin_access_token}"
                                })
      return response
    end

    # Order matters!
    get "#{root}/*" do
      return {
        :value => "Catch all.",
        :splat => params[:splat]
      }.to_json
    end
  end
end