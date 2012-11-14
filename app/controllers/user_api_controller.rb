class UserApiController < ApplicationController

  caches_action(:show)

  def status
    puts "in UserApiController status"
    p params
    user = get_user(session[:user_id])
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
    user = get_user(params[:uid])
    render :json => {
        :uid => user.uid,
        :preferredName =>  user.preferred_name || ""
    }.to_json
  end

  def get_user(uid)
    Rails.cache.fetch(cache_key(uid)) do
      User.new(uid)
    end
  end

  def cache_key(uid)
    "user_#{uid}"
  end

  def expire(uid)
    expire_action(:controller => 'user_api', :action => 'show', :uid => uid)
    Rails.cache.delete(cache_key(uid), :force => true)
  end

end
