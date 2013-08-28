class SuggestionsController < ApplicationController
  def new
    @suggestion = Suggestion.new creator: session[:creator]
  end

  def create
    session[:creator] = params[:suggestion].try(:[], :creator)

    list = List.find_by_slug(params[:list_id])
    list.suggestions.create! params[:suggestion].permit(:creator, :contents, :notes)
    redirect_to list_path(list)
  end
end
