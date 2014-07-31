json.extract! @project do |json, project|
  json.id project.id
  json.founder_id project.founder_id
  json.founder_name project.founder_name
  json.title project.title
  json.description project.description
  json.photo_url project.project_photo.url(:medium)
  json.amount_raised project.amount_raised
  json.duration project.duration
  json.website project.website
  json.category project.category

   #
  #  :funding_goal,
  #                       :amount_raised, :duration, :website, :category,
  #                       :founder_name, :created_at, :updated_at

end

json.updates @project.updates do |update|
  json.extract! update, :id, :project_id, :body, :created_at
end

json.comments @project.comments do |comment|
  json.extract! comment, :id, :project_id, :body, :created_at
end
