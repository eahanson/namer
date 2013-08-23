class ListsController < ApplicationController
  def index
  end

  def show
    @list = List.find_by_slug(params[:id])
  end

  def new
    @list = List.new
  end

  def create
    list = List.create! params[:list].permit(:creator, :title, :notes)
    redirect_to list_path(list.slug)
  end
end
