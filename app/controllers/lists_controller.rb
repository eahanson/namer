class ListsController < ApplicationController
  def index
  end

  def show
    @list = List.find_by_slug(params[:id])
    session[:recently_viewed_lists] ||= []
    session[:recently_viewed_lists].delete @list.to_param
    session[:recently_viewed_lists].unshift @list.to_param
  end

  def new
    @list = List.new creator: session[:creator]
  end

  def create
    session[:creator] = params[:list].try(:[], :creator)

    list = List.create! params[:list].permit(:creator, :title, :notes)
    redirect_to list_path(list.slug)
  end
end
