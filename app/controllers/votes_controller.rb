class VotesController < ApplicationController
  def create
    votes = List.
      find_by_slug!(params[:list_id]).
      suggestions.
      find_by_id!(params[:suggestion_id]).
      votes

    votes.create!

    render json: { votes: votes.count, suggestion: params[:suggestion_id] }
  end
end
