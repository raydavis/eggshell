class CanvasApiController < ApplicationController
  include Fakeable_Proxy

  def mycourses
    puts "in CanvasApiController mycourses"
    p params

    # TODO when mycourses is user-specific, add user id to cache key
    response = Rails.cache.fetch("canvas_api_mycourses", :expire_in => 600) do
      do_get("canvas/mycourses", "#{Settings.canvas_proxy.canvas_root}/api/v1/courses",
             {
                 :Authorization => "Bearer #{Settings.canvas_proxy.admin_access_token}"
             }, fake?(params[:fake]))
    end
    render :json => response
  end

end