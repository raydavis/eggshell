class BootstrapController < ApplicationController

  caches_page :index
  before_filter :authenticate, :except => [:index]

  def index
    # Each page has a different CSS class on the body element
    @bodyclass="cc-page-index"
  end

  def index_found
  end

  def dashboard
  end
end
