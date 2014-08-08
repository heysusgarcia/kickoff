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

class Project < ActiveRecord::Base
  validates :founder_id, :title, :description, :founder_name,
            :funding_goal, :duration, :category, presence: true
  validate :funding_goal_min_1_dollar
  has_attached_file :project_photos

  has_attached_file :project_photo, :styles => {
    :big => "640x480>",
    :medium => "240x320>",
    :small => "50x50#"
  },
  :default_url => "https://s3-us-west-2.amazonaws.com/miscrand/placeholder.jpg"
  
  validates_attachment_content_type(
    :project_photo,
    :content_type => /\Aimage\/.*\Z/
  )

  belongs_to :founder, class_name: "User", foreign_key: :founder_id
  has_many :backings, class_name: "ProjectFunding",
            foreign_key: :project_id
  has_many :funders, through: :backings, source: :funder
  has_many :followings, class_name: "ProjectFollowing", foreign_key: :project_id
  has_many :followers, through: :followings, source: :follower
  has_many :updates
  has_many :comments

  def is_backer?(user)
    !self.funders.where(id: user.id).empty?
  end

  def is_founder?(user)
    self.founder_id == user.id
  end

  private

  def funding_goal_min_1_dollar
    self.funding_goal >= 1
  end
end
