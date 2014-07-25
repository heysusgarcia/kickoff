# == Schema Information
#
# Table name: funded_projects
#
#  id            :integer          not null, primary key
#  project_title :string(255)      not null
#  amount_funded :integer          not null
#  project_id    :integer          not null
#  funder_id     :integer          not null
#  created_at    :datetime
#  updated_at    :datetime
#

require 'test_helper'

class FundedProjectTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
