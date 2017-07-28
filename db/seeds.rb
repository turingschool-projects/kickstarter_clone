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
  end

  def generate_project_backers
    50.times do
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
    10.times do |n|
      location = Location.create!(
        postal_code: Faker::Address.postcode,
        city: Faker::Address.city,
        country: Faker::Address.country
      )
      location.projects << Project.all.shuffle[0..4]
    puts "Location #{n} has been created"
    end
  end

  def generate_projects
    50.times do
      Project.create!(
        title: Faker::Commerce.product_name,
        description: Faker::Hipster.paragraph,
        image_url: "https://unsplash.it/600/400?image=#{rand(0..100)}",
        target_amount: rand(1000..10000).to_f,
        completion_date: Faker::Time.forward(30),
        category: Category.all.sample,
        rewards: generate_rewards,
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
