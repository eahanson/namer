# == Schema Information
#
# Table name: suggestions
#
#  id         :integer          not null, primary key
#  list_id    :integer          not null
#  contents   :text             not null
#  notes      :text
#  creator    :string(255)      not null
#  created_at :datetime
#  updated_at :datetime
#

require 'spec_helper'

describe Suggestion do
  describe 'validations' do
    before do
      list = mom.list!
      @valid = Suggestion.new(list_id: list.id, contents: 'contents', creator: 'creator')
      expect(@valid).to be_valid
    end

    it 'must belong to a list' do
      @valid.list_id = nil
      expect(@valid).to_not be_valid
    end

    it 'must have contents' do
      @valid.contents = ''
      expect(@valid).to_not be_valid
    end

    it 'must have a creator' do
      @valid.creator = ''
      expect(@valid).to_not be_valid
    end
  end

  it 'belongs to a list' do
    list = mom.list!
    suggestion = list.suggestions.create! contents: 'contents', creator: 'creator'
    expect(suggestion.list).to eq list
    expect(suggestion.contents).to eq 'contents'
    expect(suggestion.creator).to eq 'creator'
  end

  it 'has votes' do
    suggestion = mom.suggestion!
    vote = suggestion.votes.create!
    expect(suggestion.votes).to match_array [vote]
  end
end
