json.extract! @user do |json, user|
  json.id user.id
  json.title user.name
  json.location user.location
  json.thumb_url user.profile_photo.url(:thumb)
  json.medium_url user.profile_photo.url(:medium)
  json.biography user.biography
  json.website user.website
  json.created_at project.created_at
end

json.backed_projects @user.backed_projects do |backed_project|
  json.extract! backed_project, :id, :project_id, :project_title, :amount_funded
end

json.started_projects @user.started_projects do |started_project|
  json.extract! started_project, :id, :founder_name, :title
end

json.followed_projects @user.followed_projects do |followed_project|
  json.extract! followed_project, :id, :project_title
end
