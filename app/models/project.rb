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
#

class Project < ActiveRecord::Base
  validates :founder_id, :title, :description,
            :funding_goal, :duration, :category, presence: true
  validates :funding_goal_min_1_dollar

  belongs_to :founder, class_name: "User", foreign_key: :founder_id

  private

  def funding_goal_min_1_dollar
    funding_goal >= 1
  end
end
