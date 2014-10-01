json.extract! @project, :id, :founder_id, :founder_name, :title, :description,
                        :amount_raised, :funding_goal, :duration, :website, :category,
                        :created_at
json.medium_url @project.project_photo(:medium)
json.big_url @project.project_photo.url(:big)

json.updates @project.updates do |update|
  json.extract! update, :id, :project_id, :body, :created_at
end

json.comments @project.comments do |comment|
  json.extract! comment, :id, :project_id, :body, :created_at
  json.author comment.author
  json.profile_pic comment.author_profile_pic
end

json.followers @project.followers do |follower|
  json.extract! follower, :id, :name, :location, :biography, :website, :created_at
  json.profile follower.profile_photo.url(:profile)
end

json.funders @project.funders do |funder|
  json.extract! funder, :id, :name, :location, :biography, :website, :created_at
  json.profile funder.profile_photo.url(:profile)
end
