json.extract! @project, :id, :founder_id, :founder_name, :title, :description,
                        :amount_raised, :funding_goal, :duration, :website, :category,
                        :created_at
json.medium_url @project.project_photo(:medium)
json.big_url @project.project_photo.url(:big)

json.updates @project.updates do |update|
  json.extract! update, :id, :project_id, :body, :created_at
end

json.comments @project.comments do |comment|
  json.extract! comment, :id, :project_id, :body, :created_at
end
