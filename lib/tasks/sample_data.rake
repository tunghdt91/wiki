namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    User.create!(name: "admin",
                email: "admin@framgia.com",
                password: "framgia",
                birth_day: '1991-09-20'  ,
                password_confirmation: "framgia")
  end
end