json.extract! @user, :id, :name, :location, :biography, :website, :created_at
json.medium_url @user.profile_photo.url(:small)
json.medium_url @user.profile_photo.url(:medium)

json.backed_projects @user.backed_projects do |backed_project|
  json.id backed_project.id
  json.founder_name backed_project.founder_name
  json.title backed_project.title
  json.category backed_project.category
  json.project_photo_url backed_project.project_photo.url(:medium)
end

json.started_projects @user.started_projects do |started_project|
  json.id started_project.id
  json.founder_name started_project.founder_name
  json.title started_project.title
  json.medium_url started_project.project_photo.url(:medium)
end

json.followed_projects @user.followed_projects do |followed_project|
  json.id followed_project.id
  json.founder_name followed_project.founder_name
  json.title followed_project.title
  json.medium_url followed_project.project_photo.url(:medium)
end
