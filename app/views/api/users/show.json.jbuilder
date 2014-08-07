json.extract! @user, :id, :name, :location, :biography, :website, :created_at
json.small_url @user.profile_photo(:small)
json.medium_url @user.profile_photo(:medium)

json.backed_projects @user.backed_projects do |backed_project|
  json.id backed_project.id
  json.founder_name backed_project.founder_name
  json.foudner_id backed_project.founder_id
  json.description backed_project.description
  json.amount_raised backed_project.amount_raised
  json.title backed_project.title
  json.category backed_project.category
  json.created_at backed_project.created_at
  json.updates backed_project.updates
  json.comments backed_project.comments
  json.medium_url backed_project.project_photo.url(:medium)
  json.big_url backed_project.project_photo.url(:big)
end

json.started_projects @user.started_projects do |started_project|
  json.id started_project.id
  json.founder_name started_project.founder_name
  json.founder_id started_project.founder_id
  json.description started_project.description
  json.amount_raised started_project.amount_raised
  json.title started_project.title
  json.category started_project.category
  json.created_at started_project.created_at
  json.updates started_project.updates
  json.comments started_project.comments
  json.medium_url started_project.project_photo.url(:medium)
  json.big_url started_project.project_photo.url(:big)
end

json.followed_projects @user.followed_projects do |followed_project|
  json.id followed_project.id
  json.founder_name followed_project.founder_name
  json.founder_id followed_project.founder_id
  json.description followed_project.description
  json.amount_raised followed_project.amount_raised
  json.title followed_project.title
  json.category followed_project.category
  json.created_at followed_project.created_at
  json.updates followed_projects.updates
  json.comments followes_projects.comments
  json.medium_url followed_project.project_photo.url(:medium)
  json.big_url followed_project.project_photo.url(:big)
end
