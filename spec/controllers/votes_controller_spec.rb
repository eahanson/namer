require 'spec_helper'

describe VotesController do
  describe '#create' do
    it 'creates a vote for the suggestion' do
      suggestion = mom.suggestion

      expect {
        post :create, list_id: suggestion.list.to_param, suggestion_id: suggestion.to_param
      }.to change { suggestion.votes.count }.from(0).to(1)
    end

    it 'returns the new vote count' do
      suggestion = mom.suggestion

      suggestion.votes.create!
      suggestion.votes.create!

      post :create, list_id: suggestion.list.to_param, suggestion_id: suggestion.to_param

      expect(JSON.parse(response.body)).to eq({ 'votes' => 3, 'suggestion' => suggestion.to_param })
    end

    it 'blows up if the suggestion is not owned by the list' do
      list = mom.list
      other_list = mom.list
      suggestion = mom.suggestion(list: list)

      expect {
        post :create, list_id: other_list.to_param, suggestion_id: suggestion.to_param
      }.to raise_error ActiveRecord::RecordNotFound
    end
  end
end
