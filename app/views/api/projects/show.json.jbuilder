json.extract! @project, :title, :description, :funding_goal,
                        :duration, :amount_raised, :category, :website,
                        :founder_name

json.funders @project.funders do |funder|
  json.extract! funder, :id, :name
end

json.followers @project.followers do |follower|
  json.extract! follower, :id, :name
end
