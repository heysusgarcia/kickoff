# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

ActiveRecord::Base.transaction do

  def seed_image(file_name)
    File.open(File.join(Rails.root, "/app/assets/images/#{file_name}"))
  end

  User.create(name: "Javier Laval", email: "androidhomme@shoe.com", password: "shoeshoe", profile_photo: seed_image("androidhomme_profile.jpg"))
  User.create(name: "Clae", email: "clae@shoe.com", password: "shoeshoe", profile_photo: seed_image("clae_profile.jpg"))
  User.create(name: "Brubaker Brothers", email: "clearweather@shoe.com", password: "shoeshoe", location:"Big Sur, CA",
              biography: "For years we have talked about coming together to start a company that mimics our lifestyle.
              with age we've realized that we are not static, we change and evolve. It has become our ambition to create
              a brand that is free to reflect that movement.", profile_photo: seed_image("clearweather_profile.jpg"))
  User.create(name: "Jeff Lee", email: "jpcustomkicks@shoe.com", password: "shoeshoe", location: "San Francisco, CA", profile_photo: seed_image("jpcustomkicks_profile.jpg"))
  # User.create(name: "Lasco", email: "lasco@shoe.com", password: "shoeshoe", location:,
  #             biography:, website:, profile_photo: seed_image())
  # User.create(name: "Native", email: "native@shoe.com", password: "shoeshoe", location:,
  #             biography:, website:, profile_photo: seed_image())
  # User.create(name: "Swims", email: "swims@shoe.com", password: "shoeshoe", location:,
  #             biography:, website:, profile_photo: seed_image())
  # User.create(name: "Keds", email: "keds@shoe.com", password: "shoeshoe", location:,
  #             biography:, website:, profile_photo: seed_image())
  # User.create(name:, email:, password:, location:,
  #             biography:, website:, profile_photo: seed_image())
  # User.create(name:, email:, password:, location:,
  #             biography:, website:, profile_photo: seed_image())


  Project.create(founder_id: 1, title: "Android Homme", description: "Android, adj. possessing of human features,
                 an automaton that is created from biological materials and resembles a human. Also called a humanoid.
                 The interstellar collisions of street and lux design have birthed Android Homme. Android Homme
                 takes your basic high or low top and adds a trademark spaceman aesthetic to them, along with premium
                 leather and suede, durable gum rubber soles.", funding_goal: 30000, duration: 45, category: "fashion",
                 founder_name: "Javier Laval", project_photo: seed_image("androidhomme_project.jpg"))
  Project.create(founder_id: 2, title: "Clae", description: "description description description", funding_goal: 50000, duration: 30, category: "casual",
                 founder_name: "Name Name", project_photo: seed_image("clae_project.jpg"))
  Project.create(founder_id: 3, title: "Clear Weather", description: "Our mission is to bring true design and craftmanship to the masses. Unique, vintge
  inspired products with a futuristic feel. A brand that reflects us as we grow and expand as individuals. Premium products at an
  accessible price.", funding_goal: 50000, duration: 35, category: "",
                 founder_name: "Name Name", project_photo: seed_image("clae_project.jpg"))
  Project.create(founder_id: 4, title: "JP Custom Kicks", description: "Description Description", funding_goal: 20000, duration: 20, category: "casual",
                 founder_name: "Jeff Lee", project_photo: seed_image("jpcustomkicks_project.jpg"))
end


# create a folder/directory in db, add images, then commit to git.
# use file.open and everything should be good since images will be comitted to git
