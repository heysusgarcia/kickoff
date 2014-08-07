# json.extract! @project, :id, :founder_id, :founder_name, :title, :description,
#                         :amount_raised, :duration, :website, :category, :created_at
# json.medium_url @project.project_photo(:medium)


json.array! @projects do |project|
  json.id project.id
  json.founder_id project.founder_id
  json.founder_name project.founder_name
  json.title project.title
  json.description project.description
  json.amount_raised project.amount_raised
  json.funding_goal project.funding_goal
  json.created_at project.created_at
  json.duration project.duration
  json.website project.website
  json.category project.category
  json.medium_url project.project_photo(:medium)
  json.big_url project.project_photo(:big)
  json.comments project.comments
  json.updates project.updates
  json.followers project.followers
  json.funders json.funders
end
