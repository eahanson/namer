require 'spec_helper'

describe ListsController do
  describe "#create" do
    it 'creates a list and redirects to it' do
      post :create, list: { title: 'new title', notes: 'new notes' }

      list = List.last
      expect(list.title).to eq 'new title'
      expect(list.notes).to eq 'new notes'
      expect(list.slug).to match /[a-z0-9]+/

      response.should redirect_to list_path(list.slug)
    end
  end

  describe "#show" do
    it 'shows a list given a slug' do
      list = List.create!
      get :show, id: list.slug
      expect(assigns(:list)).to eq list
    end

    it 'does show accept a list id' do
      list = List.create!
      get :show, id: list.id
      expect(assigns(:list)).to eq nil
    end
  end
end
