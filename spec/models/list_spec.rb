require 'spec_helper'

describe List do
  describe 'before create' do
    it 'creates a slug' do
      list = List.new
      expect(list.slug).to eq nil
      list.save!
      expect(list.slug).to match /[0-9a-z]+/
    end
  end
end
