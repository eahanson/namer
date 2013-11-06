class SuggestionsController < ApplicationController
  before_filter :load_list

  def new
    @suggestion = Suggestion.new creator: session[:creator]
  end

  def create
    session[:creator] = params[:suggestion].try(:[], :creator)

    @list.suggestions.create! params[:suggestion].permit(:creator, :contents)
    redirect_to list_path(@list)
  end
end
