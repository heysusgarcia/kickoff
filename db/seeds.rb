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

# USERS
  User.create(name: "Javier Laval", email: "androidhomme@shoe.com", password: "shoeshoe", profile_photo: seed_image("androidhomme_profile.jpg"))
  User.create(name: "Sung Choi", email: "clae@shoe.com", password: "shoeshoe", profile_photo: seed_image("clae_profile.jpg"))
  User.create(name: "Brubaker Brothers", email: "clearweather@shoe.com", password: "shoeshoe", location:"Big Sur, CA",
              biography: "For years we have talked about coming together to start a company that mimics our lifestyle.
              with age we've realized that we are not static, we change and evolve. It has become our ambition to create
              a brand that is free to reflect that movement.", profile_photo: seed_image("clearweather_profile.jpg"))
  User.create(name: "Jeff Lee", email: "jpcustomkicks@shoe.com", password: "shoeshoe", location: "San Francisco, CA", profile_photo: seed_image("jpcustomkicks_profile.jpg"))
  User.create(name: "John R", email: "swims@shoe.com", password: "shoeshoe", location: "New York, NY",
              biography: "The SWIMS galosh is the product of my own experience, my appreciation of functional design, and my odd fascination with big city rain.",
              website:, profile_photo: seed_image("swims_profile.jpg"))
  User.create(name: "Damian Van Zyll De Jong", email: "native@shoe.com", password: "shoeshoe", location: "Los Angeles, CA",
              profile_photo: seed_image("native_profile.jpg"))
  User.create(name: "John Doe", email: "baseball@shoe.com", password: "shoeshoe", location: "Miami, FL")
  User.create(name: "Dameon", email: "basketball@shoe.com", password: "shoeshoe", location: "San Jose, CA")
  # User.create(name: "Lasco", email: "lasco@shoe.com", password: "shoeshoe", location:,
  #             biography:, website:, profile_photo: seed_image())
  # User.create(name: "Keds", email: "keds@shoe.com", password: "shoeshoe", location:,
  #             biography:, website:, profile_photo: seed_image())
  # User.create(name:, email:, password:, location:,
  #             biography:, website:, profile_photo: seed_image())
  User.create(name: "Jeremy Tan", email: "jeremy@tan.com", password: "shoeshoe", location: "Emeryville, CA",
              profile_photo: seed_image("jeremy_profile.jpg"))
  User.create(name: "Harold Tafur", email: "Harold@tafur.com", password: "shoeshoe", location: "Hayward, CA",
              profile_photo: seed_image("harold_profile.jpg"))
  User.create(name: "Peter Nishinaga", email: "peter@nishinaga.com", password: "shoeshoe", location: "New York, NY",
              profile_photo: seed_image("peter_profile.jpg"))
  User.create(name: "Paul Son", email: "paul@son.com", password: "shoeshoe", location: "Berkeley, CA", profile_photo: seed_image("paul_profile.jpg"))
  User.create(name: "Guest", email: "guest@kickoff.com", password: "shoeshoe", location: "San Francisco, CA")
  User.create(name: "Shane Victorino", email: "shane@victorino.com", password: "shoeshoe", location: "Boston, MA")



# PROJECTS
  Project.create(founder_id: 1, title: "Android Homme", description: "The interstellar collisions of street and lux design. Android Homme
                 takes your basic high or low top and adds a trademark spaceman aesthetic to them, along with premium
                 leather and suede, durable gum rubber soles.", funding_goal: 30_000, duration: 45, category: "fashion",
                 founder_name: "Javier Laval", project_photo: seed_image("androidhomme_project.jpg"))
  Project.create(founder_id: 2, title: "Clae", description: "A distinct collection of smart essentials fit for the modern man.
                 Taking extra steps by using premium leathers and materials, and emphasizing uncommon comfort and versatility,
                 CLAE creates footwear that evolves and endures.", funding_goal: 50_000, duration: 30, category: "casual",
                 founder_name: "Sung Choi", project_photo: seed_image("clae_project.jpg"))
  Project.create(founder_id: 3, title: "Clear Weather", description: "Our mission is to bring true design and craftmanship to the masses. Unique, vintge
                 inspired products with a futuristic feel. A brand that reflects us as we grow and expand as individuals. Premium products at an
                 accessible price.", funding_goal: 65_000, duration: 35, category: "",
                 founder_name: "Name Name", project_photo: seed_image("clae_project.jpg"))
  Project.create(founder_id: 4, title: "JP Custom Kicks", description: "Description Description", funding_goal: 20_000, duration: 20, category: "casual",
                 founder_name: "Jeff Lee", project_photo: seed_image("jpcustomkicks_project.jpg"))
  Project.create(founder_id: 5, title: "Swims", description: "I searched for the right product before I finally took matters in my own hands and decided to
                 develop SWIMS - The Modern Galosh! A stylish solution, embodying the essence of practicality: Wear your favorite shoes, slip on SWIMS
                 when the weather is rough, slip’em off when you arrive at your destination. Enhanced comfort is assured and your shoes are guaranteed to stay shiny.",
                 funding_goal: 35_000, duration: 30, category: "casual",
                 founder_name: "John R", project_photo: seed_image("swims_project.jpg"))
  Project.create(founder_id: 6, title: "Native", description: "Footwear for the future done in the style of everything we've ever loved about shoe design. You can slip
                 them on for a quick stroll, throw them into your backpack for a day at the beach or keep them on hand for apres. Our aesthetic is relaxed, flexible and active.
                 Native Shoes is footwear for anybody, anywhere, anytime.", funding_goal: 20_000, duration: 20, category: "casual",
                 founder_name: "Damian Van Zyll De Jong", project_photo: seed_image("native_project.jpg"))
  Project.create(founder_id: 7, title: "Shanes", description: "Our mission is to bring baseball cleats to the masses that are functional and look great.",
                 funding_goal: 20_000, duration: 20, category: "baseball", founder_name: "John Doe", project_photo: seed_image("native_project.jpg"))
  Project.create(founder_id: 8, title: "Kicksters", description: "I searced for the right material to develop stylish, yet functional,
                 basketball shoes. Our shoes are breathable and comfortable.", funding_goal: 20_000, duration: 20, category: "basektball",
                 founder_name: "Dameon", project_photo: seed_image("basketball_project.jpg"))

# # UPDATES
#   Update.create
#
# # PROJECT FUNDINGS
#   ProjectFunding.create
#
# # PROJECT FOLLOWINGS
#   ProjectFollowing.create
#
# #COMMENTS
#   Comment.create
end
