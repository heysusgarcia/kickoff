json.extract! @project, :id, :founder_id, :founder_name, :title, :description,
                        :amount_raised, :duration, :website, :category, :created_at
json.medium_url @project.project_photo(:medium)

json.updates @project.updates do |update|
  json.id update.id
  json.project_id update.project_id
  json.body update.body
  json.created_at update.created_at
end

json.comments @project.comments do |comment|
  json.id comment.id
  json.project_id comment.project_id
  json.body comment.body
  json.created_at comment.created_at
end
