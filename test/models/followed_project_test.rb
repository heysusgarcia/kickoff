# == Schema Information
#
# Table name: followed_projects
#
#  id            :integer          not null, primary key
#  project_title :string(255)      not null
#  follower_id   :integer          not null
#  project_id    :integer          not null
#  created_at    :datetime
#  updated_at    :datetime
#

require 'test_helper'

class FollowedProjectTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
