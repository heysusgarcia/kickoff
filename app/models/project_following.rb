# == Schema Information
#
# Table name: project_followings
#
#  id            :integer          not null, primary key
#  project_title :string(255)      not null
#  follower_id   :integer          not null
#  project_id    :integer          not null
#  created_at    :datetime
#  updated_at    :datetime
#

class ProjectFollowing < ActiveRecord::Base
  validates :project_title, :follower_id, :project_id, presence: true

  belongs_to :follower, class_name: "User", foreign_key: :follower_id

end
