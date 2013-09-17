# == Schema Information
#
# Table name: votes
#
#  id            :integer          not null, primary key
#  suggestion_id :integer
#  created_at    :datetime
#  updated_at    :datetime
#

class Vote < ActiveRecord::Base
end
