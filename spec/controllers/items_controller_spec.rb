require 'spec_helper'

describe ItemsController do
  describe '#create' do
    it 'creates an item and redirects back to the list' do
      list = mom.list!
      post :create, list_id: list.to_param, item: { creator: 'creator', contents: 'contents', notes: 'notes' }

      item = Item.last
      expect(item.list).to eq list
      expect(item.creator).to eq 'creator'
      expect(item.contents).to eq 'contents'
      expect(item.notes).to eq 'notes'

      expect(response).to redirect_to list_path(list)
    end
  end
end
