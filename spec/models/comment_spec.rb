# == Schema Information
#
# Table name: comments
#
#  id            :integer          not null, primary key
#  creator       :string(255)
#  suggestion_id :integer
#  contents      :text
#  created_at    :datetime
#  updated_at    :datetime
#

require 'spec_helper'

describe Comment do
  it 'belongs to a suggestion' do
    suggestion = mom.suggestion!
    comment = suggestion.comments.create! creator: 'fred', contents: 'no comment'
    expect(suggestion.reload.comments).to match_array [comment]
  end
end
