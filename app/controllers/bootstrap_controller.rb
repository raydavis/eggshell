class BootstrapController < ApplicationController

  caches_page :index
  before_filter :authenticate, :except => [:index]

  def index
  end

end
