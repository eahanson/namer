class SuggestionsController < ApplicationController
  def new
    @suggestion = Suggestion.new
  end

  def create
    list = List.find_by_slug(params[:list_id])
    list.suggestions.create! params[:suggestion].permit(:creator, :contents, :notes)
    redirect_to list_path(list)
  end
end
