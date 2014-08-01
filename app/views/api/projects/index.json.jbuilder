# json.extract! @project, :id, :founder_id, :founder_name, :title, :description,
#                         :amount_raised, :duration, :website, :category, :created_at
# json.medium_url @project.project_photo(:medium)


json.array! @projects do |project|
  json.id project.id
  json.founder_id project.founder_id
  json.founder_name project.founder_name
  json.title project.description
  json.amount_raised project.amount_raised
  json.duration project.duration
  json.website project.website
  json.category project.category
  json.medium_url project.project_photo
end
