require 'faker'
class Seed

  def self.start
    seed = Seed.new
    seed.generate_countries
    seed.generate_cities
    seed.generate_categories
    seed.generate_projects
    seed.generate_user_with_projects
    seed.generate_users
    seed.generate_project_backers

  end

  def generate_project_backers
    50.times do
      proj = ProjectBacker.create!(
                            project: Project.all.shuffle.first,
                            user: User.all.shuffle.first,
                            reward: Reward.all.shuffle.first,
                            pledge_amount: rand(10..1000)
      )
      puts "ProjectBacker #{proj.user} backing #{proj.project.title} created"
    end
  end

  def generate_users
    10.times do |n|
      u = User.create!(name: "user #{n}",
                   email: "user#{n}@example.com",
                   password: "password",
                   password_confirmation: "password"
                   )
      puts "User #{u.name}, #{u.email} created"
    end
  end

  def generate_projects
    50.times do
      Project.create!(
        title: Faker::Commerce.product_name + rand(0..1000).to_s,
        description: Faker::Hipster.paragraph,
        image_url: "https://unsplash.it/600/400?image=#{rand(0..100)}",
        target_amount: rand(1000..100000).to_f,
        completion_date: Faker::Time.forward(30),
        category: Category.all.sample,
        rewards: generate_rewards,
        country_id: rand(1..4),
        city_id: rand(1..5)
      )
      puts "Project #{Project.all.last.title} created"
    end
  end

  def generate_rewards
    4.times.map do |n|
      Reward.create!({title: "reward_#{n}",
                      description: Faker::Hipster.paragraph,
                      pledge_amount: n * 100,
                      limit: 4})
    end
  end

  def generate_categories
    categories = ['Art', 'Technology', 'Design', 'Games', 'Fashion']
    categories.each do |category|
      Category.create(name: category)
    end
  end

  def generate_countries
    countries = ['United States', 'Canada', 'Mexico', "France"]
    countries.each do |country|
      Country.create(name: country)
    end
  end

  def generate_user_with_projects
    user = User.create!(
    name: "Sample User",
    email: "email#{rand(5000)}@email.com",
    password: "password",
    password_confirmation: "password"
    )
    user.projects << Project.all.shuffle[0..4]
  end

  def generate_cities
    cities = ["New York", "Paris", "Denver", "Chicago", "San Francisco"]
      cities.each do |city|
        City.create(name: city, country_id: rand(1..4))
      puts "City #{City.name} created"
    end
  end
end

Seed.start
