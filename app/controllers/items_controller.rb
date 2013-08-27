class ItemsController < ApplicationController
  def new
    @item = Item.new
  end

  def create
    list = List.find_by_slug(params[:list_id])
    list.items.create! params[:item].permit(:creator, :contents, :notes)
    redirect_to list_path(list)
  end
end
