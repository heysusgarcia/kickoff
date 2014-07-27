# == Schema Information
#
# Table name: updates
#
#  id         :integer          not null, primary key
#  project_id :integer          not null
#  created_at :datetime
#  updated_at :datetime
#  body       :text             not null
#

require 'test_helper'

class UpdateTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
