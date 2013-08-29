class WelcomeController < ApplicationController
  def index
    @hide_navbar = true
    @recently_viewed_lists = List.where(slug: session[:recently_viewed_lists])
  end
end
