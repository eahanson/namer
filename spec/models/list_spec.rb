# == Schema Information
#
# Table name: lists
#
#  id         :integer          not null, primary key
#  title      :text             not null
#  notes      :text
#  created_at :datetime
#  updated_at :datetime
#  slug       :string(255)
#  creator    :string(255)      not null
#

require 'spec_helper'

describe List do
  describe 'before create' do
    it 'creates a slug' do
      list = List.new creator: 'Fred', title: 'Title'
      expect(list.slug).to eq nil
      list.save!
      expect(list.slug).to match /[0-9a-z]+/
    end
  end

  describe 'validations' do
    before do
      @valid = List.new(creator: 'Fred', title: 'Title')
      expect(@valid).to be_valid
    end

    it 'requires a creator' do
      @valid.creator = nil
      expect(@valid).to_not be_valid
    end

    it 'requires a title' do
      @valid.title = nil
      expect(@valid).to_not be_valid
    end
  end
end
