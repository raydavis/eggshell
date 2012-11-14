class CanvasApiController < ApplicationController
  include Fakeable_Proxy

  def mycourses
    puts "in CanvasApiController mycourses"
    p params

    render :json => do_get("canvas/mycourses", "#{Settings.canvas_proxy.canvas_root}/api/v1/courses",
                           {
                             :Authorization => "Bearer #{Settings.canvas_proxy.admin_access_token}"
                           }, fake?(params[:fake]))
  end

end