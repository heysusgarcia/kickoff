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
  validates :project_id, :body, :author_id, presence: true

  belongs_to :project

  def author
    user = User.find(self.author_id)
    user.name
  end
end
