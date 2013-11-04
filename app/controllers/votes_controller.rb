class VotesController < ApplicationController
  before_filter :load_list_and_suggestion

  def create
    votes = @suggestion.votes

    votes.create!

    render json: { votes: votes.count, suggestion: params[:suggestion_id] }
  end
end
