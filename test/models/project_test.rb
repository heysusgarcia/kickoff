# == Schema Information
#
# Table name: projects
#
#  id                         :integer          not null, primary key
#  founder_id                 :integer          not null
#  title                      :string(255)      not null
#  description                :text             not null
#  funding_goal               :integer          not null
#  amount_raised              :integer          default(0)
#  created_at                 :datetime
#  updated_at                 :datetime
#  duration                   :integer          not null
#  website                    :text
#  category                   :string(255)      not null
#  founder_name               :string(255)      not null
#  project_photo_file_name    :string(255)
#  project_photo_content_type :string(255)
#  project_photo_file_size    :integer
#  project_photo_updated_at   :datetime
#

require 'test_helper'

class ProjectTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
