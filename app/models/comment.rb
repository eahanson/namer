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

class Comment < ActiveRecord::Base
  belongs_to :suggestion
end
