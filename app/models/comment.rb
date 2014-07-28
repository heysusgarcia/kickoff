# == Schema Information
#
# Table name: comments
#
#  id         :integer          not null, primary key
#  project_id :integer          not null
#  body       :text             not null
#  created_at :datetime
#  updated_at :datetime
#

class Comment < ActiveRecord::Base
  validates :project_id, :backer_id, :body, presence: true

  belongs_to :project
end
