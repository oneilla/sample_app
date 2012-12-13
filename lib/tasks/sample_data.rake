namespace :db do
  desc "Fill database with sample data"
  task :populate => :environment do
    Rake::Task['db:reset'].invoke
    make_users
    make_microposts
    make_relationships
  end
end

def make_users
    admin = User.create!(:name => "Albus Percival Wulfric Brian Dumbledore",
                         :email => "headmaster@hogwarts.edu",
                         :password => "lemondrop",
                         :password_confirmation => "lemondrop")
    admin.toggle!(:admin)
    9.times do |n|
      name  = Faker::Name.name
      email = "example-#{n+1}@railstutorial.org"
      password  = "password"
      User.create!(:name => name,
                   :email => email,
                   :password => password,
                   :password_confirmation => password)
    end
end

def make_microposts
    User.all(:limit => 6).each do |user|
       10.times do
         content = Faker::Lorem.sentence(5)
         user.microposts.create!(:content => content)
      end
    end
end

def make_relationships
  users = User.all
  user  = users.first
  following = users[1..5]
  followers = users[3..4]
  following.each { |followed| user.follow!(followed) }
  followers.each { |follower| follower.follow!(user) }
end
