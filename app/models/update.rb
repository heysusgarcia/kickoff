# == Schema Information
#
# Table name: updates
#
#  id         :integer          not null, primary key
#  project_id :integer          not null
#  created_at :datetime
#  updated_at :datetime
#  body       :text             not null
#

class Update < ActiveRecord::Base
  validates :project_id
  belongs_to :project
end
