json.extract! @user, :id, :name, :location, :biography, :website, :profile_photo

json.back_projects @user.backed_projects do |backed_project|
  json.extract! backed_project, :id, :title
end

json.started_projects @user.started_projects do |started_project|
  json.extract! started_project, :id, :title
end

json.followed_projects @user.followed_projects do |followed_project|
  json.extract! followed_project, :id, :title
end
