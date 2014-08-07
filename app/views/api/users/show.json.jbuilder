json.extract! @user, :id, :name, :location, :biography, :website, :created_at
json.small_url @user.profile_photo(:small)
json.medium_url @user.profile_photo(:medium)

json.backed_projects @user.backed_projects do |backed_project|
  json.extract! backed_project, :id, :founder_name, :founder_id, :description,
                                :amount_raised, :title, :category, :created_at,
                                :updates, :comments
  json.medium_url backed_project.project_photo.url(:medium)
  json.big_url backed_project.project_photo.url(:big)
end

json.started_projects @user.started_projects do |started_project|
  json.extract! started_project, :id, :founder_name, :founder_id, :description,
                                :amount_raised, :title, :category, :created_at,
                                :updates, :comments
  json.medium_url started_project.project_photo.url(:medium)
  json.big_url started_project.project_photo.url(:big)
end

json.followed_projects @user.followed_projects do |followed_project|
  json.extract! followed_project, :id, :founder_name, :founder_id, :description,
                                :amount_raised, :title, :category, :created_at,
                                :updates, :comments
  json.medium_url followed_project.project_photo.url(:medium)
  json.big_url followed_project.project_photo.url(:big)
end
