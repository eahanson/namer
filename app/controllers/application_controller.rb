class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def load_list_and_suggestion
    @list = List.find_by_slug!(params[:list_id])
    @suggestion = @list.suggestions.find_by_id!(params[:suggestion_id])
  end
end
