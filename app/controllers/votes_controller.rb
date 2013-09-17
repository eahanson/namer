class VotesController < ApplicationController
  def create
    List.
      find_by_slug!(params[:list_id]).
      suggestions.
      find_by_id!(params[:suggestion_id]).
      votes.
      create!

    head :ok
  end
end
