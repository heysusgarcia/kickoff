# == Schema Information
#
# Table name: project_fundings
#
#  id            :integer          not null, primary key
#  project_title :string(255)      not null
#  amount_funded :integer          not null
#  project_id    :integer          not null
#  funder_id     :integer          not null
#  created_at    :datetime
#  updated_at    :datetime
#

class ProjectFunding < ActiveRecord::Base
  validates :project_title, :amount_funded, :project_id,
            :funder_id, presence: true

  belongs_to :funder, class_name: "User", foreign_key: :funder_id

end
