require 'spec_helper'

describe SuggestionsController do
  describe '#create' do
    it 'creates a suggestion and redirects back to the list' do
      list = mom.list!
      post :create, list_id: list.to_param, suggestion: { creator: 'creator', contents: 'contents', notes: 'notes' }

      suggestion = Suggestion.last
      expect(suggestion.list).to eq list
      expect(suggestion.creator).to eq 'creator'
      expect(suggestion.contents).to eq 'contents'
      expect(suggestion.notes).to eq 'notes'

      expect(response).to redirect_to list_path(list)
    end
  end
end
