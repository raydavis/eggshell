class SessionsController < ApplicationController

  def lookup
    auth = request.env["omniauth.auth"]
    #do something useful with the uid eventually, like check oracle
    session[:user_id] = auth['uid']
    redirect_to dashboard_url, :notice => "Signed in!"
  end

  def destroy
    reset_session
    redirect_to "#{Settings.cas_logout_url}?url=#{CGI.escape(request.protocol + request.host_with_port)}"
  end

  def new
    redirect_to '/auth/cas'
  end

  def failure
    redirect_to root_url, :alert => "Authentication error: #{params[:message].humanize}"
  end

end
