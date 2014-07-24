# == Schema Information
#
# Table name: projects
#
#  id            :integer          not null, primary key
#  founder_id    :integer          not null
#  title         :string(255)      not null
#  description   :text             not null
#  funding_goal  :integer          not null
#  amount_raised :integer          default(0)
#  goal_date     :date             not null
#  created_at    :datetime
#  updated_at    :datetime
#

require 'test_helper'

class ProjectTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
