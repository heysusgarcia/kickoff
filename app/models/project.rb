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
#  created_at    :datetime
#  updated_at    :datetime
#  duration      :integer          not null
#  website       :text
#  category      :string(255)      not null
#  founder_name  :string(255)      not null
#

class Project < ActiveRecord::Base
  validates :founder_id, :title, :description, :founder_name,
            :funding_goal, :duration, :category, presence: true
  validate :funding_goal_min_1_dollar

  belongs_to :founder, class_name: "User", foreign_key: :founder_id
  has_many :backings, class_name: "ProjectFunding",
            foreign_key: :project_id
  has_many :funders, through: :backings, source: :funder
  has_many :followings, class_name: "ProjectFollowing", foreign_key: :project_id
  has_many :followers, through: :followings, source: :follower


  def self.recent
    Project.last(4)
  end

  private

  def funding_goal_min_1_dollar
    funding_goal >= 1
  end
end

# Nested resources/custom member GET action:
# * "/api/projects/123/followers"
# * ProjectsController#followers => render json: @project.followers
# * "/api/projects/123/funders"

# Backbone:
# * ProjectFollowers collection
#      * Route: /api/projects/???/followers
#      * Model: User
#      * Write a Project#followers association coll method
