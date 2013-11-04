require 'spec_helper'

describe SuggestionsController do
  describe '#create' do
    it 'creates a suggestion and redirects back to the list' do
      list = mom.list
      post :create, list_id: list.to_param, suggestion: { creator: 'creator', contents: 'contents' }

      suggestion = Suggestion.last
      expect(suggestion.list).to eq list
      expect(suggestion.creator).to eq 'creator'
      expect(suggestion.contents).to eq 'contents'

      expect(response).to redirect_to list_path(list)
    end

    it 'adds the creator to the session' do
      expect {
        list = mom.list
        post :create, list_id: list.to_param, suggestion: { creator: 'creator', contents: 'contents', notes: 'notes' }
      }.to change { session[:creator] }.from(nil).to('creator')
    end
  end

  describe '#new' do
    it 'creates a new suggestion with the creator from the session' do
      list = mom.list
      session[:creator] = 'the creator'
      get :new, list_id: list.to_param
      expect(assigns(:suggestion).creator).to eq 'the creator'
    end
  end
end
