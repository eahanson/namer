class CommentsController < ApplicationController
  before_filter :load_list_and_suggestion

  def new
    @comment = @suggestion.comments.build(creator: session[:creator])
  end

  def create
    session[:creator] = params[:comment].try(:[], :creator)
    @suggestion.comments.create!(params[:comment].permit(:creator, :contents))
    redirect_to list_path(@list)
  end
end
