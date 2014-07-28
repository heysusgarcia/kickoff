# == Schema Information
#
# Table name: project_followings
#
#  id          :integer          not null, primary key
#  follower_id :integer          not null
#  project_id  :integer          not null
#  created_at  :datetime
#  updated_at  :datetime
#

class ProjectFollowing < ActiveRecord::Base
  validates :follower_id, :project_id, presence: true

  belongs_to :follower, class_name: "User", foreign_key: :follower_id
  belongs_to :project, class_name: "Project", foreign_key: :follower_id
end
