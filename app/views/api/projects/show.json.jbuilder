json.extract! @project, :id, :founder_id, :title, :description, :funding_goal,
                        :amount_raised, :duration, :website, :category,
                        :founder_name, :created_at, :updated_at

json.updates @project.updates do |update|
  json.extract! update, :id, :project_id, :body, :created_at
end

json.comments @project.comments do |comment|
  json.extract! comment, :id, :project_id, :body, :created_at
end
