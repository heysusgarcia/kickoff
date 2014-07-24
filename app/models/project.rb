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

class Project < ActiveRecord::Base
  validates :founder_id, :title, :description,
            :funding_goal, :goal_date, presence: true

  belongs_to :founder, class_name: "User", foreign_key: :founder_id
end
