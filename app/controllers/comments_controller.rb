class CommentsController < ApplicationController
  def new
    @list = List.find_by_slug(params[:list_id])
    @suggestion = @list.suggestions.find_by_id(params[:suggestion_id])
    @comment = @suggestion.comments.build(creator: session[:creator])
  end

  def create
    session[:creator] = params[:comment].try(:[], :creator)

    list = List.find_by_slug(params[:list_id])
    suggestion = list.suggestions.find_by_id(params[:suggestion_id])
    suggestion.comments.create!(params[:comment].permit(:creator, :contents))

    redirect_to list_path(list)
  end
end
