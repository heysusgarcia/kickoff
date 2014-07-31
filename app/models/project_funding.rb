# == Schema Information
#
# Table name: project_fundings
#
#  id            :integer          not null, primary key
#  project_id    :integer          not null
#  funder_id     :integer          not null
#  created_at    :datetime
#  updated_at    :datetime
#  project_title :string(255)
#  amount_funded :integer
#

class ProjectFunding < ActiveRecord::Base
  validates :project_id, :project_title, :project_fundings,
            :funder_id, presence: true

  belongs_to :funder, class_name: "User", foreign_key: :funder_id
  belongs_to :project, class_name: "Project", foreign_key: :project_id

end
