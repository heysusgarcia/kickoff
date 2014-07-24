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
  validates :funding_goal_min_1_dollar
  before_validation :convert_goal_to_integer

  belongs_to :founder, class_name: "User", foreign_key: :founder_id


  private

  def funding_goal_min_1_dollar
    funding_goal >= 1
  end

  //will store curreny as an integer
  def convert_goal_to_integer
    self.funding_goal = self.funding_goal * 10
  end
end
