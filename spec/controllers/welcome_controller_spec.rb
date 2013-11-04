require 'spec_helper'

describe WelcomeController do
  describe '#index' do
    it 'lists recently viewed lists from the session' do
      list1 = mom.list
      list2 = mom.list
      list3 = mom.list
      list4 = mom.list
      session[:recently_viewed_lists] = [list1, list2, list3].map(&:to_param)

      get :index

      expect(assigns(:recently_viewed_lists)).to eq [list1, list2, list3]
    end
  end
end
