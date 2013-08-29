require 'spec_helper'

describe ListsController do
  describe "#create" do
    it 'creates a list and redirects to it' do
      post :create, list: { creator: 'new creator', title: 'new title', notes: 'new notes' }

      list = List.last
      expect(list.creator).to eq 'new creator'
      expect(list.title).to eq 'new title'
      expect(list.notes).to eq 'new notes'
      expect(list.slug).to match /[a-z0-9]+/

      response.should redirect_to list_path(list.slug)
    end

    it 'adds the creator to the session' do
      expect {
        post :create, list: { creator: 'new creator', title: 'new title', notes: 'new notes' }
      }.to change { session[:creator] }.from(nil).to('new creator')
    end
  end

  describe '#new' do
    it 'creates a new list with the creator from the session' do
      session[:creator] = 'the creator'
      get :new
      expect(assigns(:list).creator).to eq 'the creator'
    end
  end

  describe "#show" do
    it 'shows a list given a slug' do
      list = mom.list!
      get :show, id: list.slug
      expect(assigns(:list)).to eq list
    end

    it 'does show accept a list id' do
      list = mom.list!
      get :show, id: list.id
      expect(assigns(:list)).to eq nil
    end

    describe 'recently viewed lists' do
      it 'stores the list in the session' do
        list = mom.list!
        get :show, id: list.to_param
        expect(session[:recently_viewed_lists]).to eq [list.to_param]
      end

      it 'does not store the list in the session if it already exists' do
        list = mom.list!
        session[:recently_viewed_lists] = [list.to_param]
        get :show, id: list.to_param
        expect(session[:recently_viewed_lists]).to eq [list.to_param]
      end

      it 'puts the most recent one at the front of the list' do
        oldest = mom.list!
        old = mom.list!
        newer = mom.list!

        session[:recently_viewed_lists] = [newer, old, oldest].map(&:to_param)

        get :show, id: old.to_param

        expect(session[:recently_viewed_lists]).to eq [old, newer, oldest].map(&:to_param)
      end
    end
  end
end
