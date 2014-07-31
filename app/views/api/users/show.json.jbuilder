json.extract! @user, :id, :name, :location, :biography, :website, :profile_photo, :created_at
json.medium_url @user.profile_photo.url(:small)
json.medium_url @user.profile_photo.url(:medium)

json.backed_projects @user.backed_projects do |backed_project|
  json.id backed_project.id
  json.project_id backed_project.project_id
  json.project_title backed_project.project_title
  json.amount_funded backed_project.amount_funded
end

json.started_projects @user.started_projects do |started_project|
  json.id started_project.id
  json.founder_name started_project.founder_name
  json.title started_project.title
  json.medium_url started_project.project_photo.url(:medium)
  json.photo_url started_project.project_photo.url
end

json.followed_projects @user.followed_projects do |followed_project|
  json.id followed_project.id
  json.project_id followed_project.project_id
  jsob.project_title followed_project.project_title
end
