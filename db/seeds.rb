require 'faker'
class Seed

  def self.start
    seed = Seed.new
    seed.generate_categories
    seed.generate_projects
    seed.generate_locations
    seed.generate_users
    seed.generate_user_with_projects
    seed.generate_project_backers
    seed.assign_location
  end

  def generate_project_backers
    100.times do
      proj = ProjectBacker.create!(
                            project: Project.all.shuffle.first,
                            user: User.all.shuffle.first,
                            reward: Reward.all.shuffle.first,
                            pledge_amount: rand(200..1000)
      )
      puts "ProjectBacker #{proj.user} backing #{proj.project.title} created"
    end
  end

  def generate_users
      User.create!(name: "Bill",
                   email: "user@user.com",
                   password: "password",
                   password_confirmation: "password"
                   )
    10.times do |n|
      u = User.create!(name: "user #{n}",
                   email: Faker::Internet.email,
                   password: "password",
                   password_confirmation: "password"
                   )
      puts "User #{u.name}, #{u.email} created"
    end
  end

  def generate_locations
    20.times do |n|
      location = Location.create!(
        postal_code: Faker::Address.postcode,
        city: Faker::Address.city,
        country: Faker::Address.country
      )
      location.projects << Project.all.shuffle[0..4]
    puts "Location #{n} has been created"
    end
  end

  def assign_location
    location = Location.create!(
      postal_code: "80202",
      city: "Denver",
      country: "United States"
    )
    Project.all.each do |project|
      if project.location == nil
        project.update(location_id: location.id)
      end
    end
  end

  def generate_projects
    50.times do
      Project.create!(
        title: Faker::Commerce.product_name,
        description: Faker::Hipster.paragraph,
        image_url: "https://unsplash.it/600/400?image=#{rand(0..100)}",
        target_amount: rand(1000..10000).to_f,
        completion_date: rand(Date.civil(2017, 9, 1)..Date.civil(2018, 12, 31)),
        category: Category.all.sample,
        rewards: generate_rewards,
      )
      puts "Project #{Project.all.last.title} created"
    end
  end

  def generate_rewards
    4.times.map do |n|
      Reward.create!({title: "Reward #{n}",
                      description: Faker::Hipster.paragraph,
                      pledge_amount: (n+1) * 100,
                      limit: 4})
    end
  end

  def generate_categories
    categories = ['Art', 'Technology', 'Design', 'Games', 'Fashion']
    categories.each do |category|
      Category.create(name: category)
    end
  end

  def generate_user_with_projects
    user = User.create!(
    name: "Sample User",
    email: Faker::Internet.email,
    password: "password",
    password_confirmation: "password"
    )
    user.projects << Project.all.shuffle[0..4]
  end

end

Seed.start
