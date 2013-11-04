require 'spec_helper'

describe CommentsController do
  describe '#new' do
    it 'creates a new comment attached to the list and suggestion' do
      suggestion = mom.suggestion

      get :new, list_id: suggestion.list.to_param, suggestion_id: suggestion.to_param

      expect(assigns(:list)).to eq suggestion.list
      expect(assigns(:suggestion)).to eq suggestion
      expect(assigns(:comment).suggestion).to eq suggestion
      expect(assigns(:comment).suggestion.list).to eq suggestion.list
    end

    it 'uses the creator from the session' do
      session[:creator] = 'the creator'

      suggestion = mom.suggestion

      get :new, list_id: suggestion.list.to_param, suggestion_id: suggestion.to_param

      expect(assigns(:comment).creator).to eq 'the creator'
    end
  end

  describe '#create' do
    it 'creates a new comment' do
      suggestion = mom.suggestion

      post :create, list_id: suggestion.list.to_param, suggestion_id: suggestion.to_param, comment: { creator: 'Kree Ator', contents: 'My comment' }

      comment = suggestion.comments.last
      expect(comment.suggestion).to eq suggestion
      expect(comment.creator).to eq 'Kree Ator'
      expect(comment.contents).to eq 'My comment'

      expect(response).to redirect_to list_path(suggestion.list)
    end

    it 'adds the creator to the session' do
      expect {
        suggestion = mom.suggestion

        post :create, list_id: suggestion.list.to_param, suggestion_id: suggestion.to_param, comment: { creator: 'creator', contents: 'contents' }
      }.to change { session[:creator] }.from(nil).to('creator')
    end
  end
end
