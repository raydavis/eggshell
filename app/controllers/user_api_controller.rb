class UserApiController < ApplicationController
  def status
    puts "in UserApiController status"
    p params
    user = User.new(session[:user_id])
    if session[:user_id]
      render :json => {
          :isLoggedIn => true,
          :preferredName => user.preferred_name || "",
          :uid => session[:user_id],
          :widgetData => {}
      }.to_json
    else
      render :json => {
          :isLoggedIn => false
      }.to_json
    end
  end

  def show
    puts "in UserApiController show"
    p params
    user = User.new(params[:uid])
    render :json => {
        :uid => user.uid,
        :preferredName =>  user.preferred_name || ""
    }.to_json
  end
end