# == Schema Information
#
# Table name: comments
#
#  id         :integer          not null, primary key
#  project_id :integer          not null
#  body       :text             not null
#  created_at :datetime
#  updated_at :datetime
#  author_id  :integer          not null
#

class Comment < ActiveRecord::Base
  validates :project_id, :body, :author_id, presence: true

  belongs_to :project
  belongs_to :author, class_name: "User", foreign_key: :author_id

  def author
    user = User.find(self.author_id)
    user.name
  end

  def author_profile_pic
    user = User.find(self.author_id)
    user.profile_photo(:profile)
  end
end
