json.extract! @project, :id, :founder_id, :title, :description, :funding_goal,
                        :amount_raised, :duration, :website, :category,
                        :founder_name, :created_at, :updated_at

json.followings @project.followings do |following|
  json.extract! following, :id, :project_title, :project_id
end

json.backings @project.backings do |backing|
  json.extract! backing, :id, :project_title, :project_id
end
