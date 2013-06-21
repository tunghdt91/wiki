namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    User.create!(name: "admin",
                email: "admin@framgia.com",
                password: "dangtung",
                birth_day: '1991-09-20'  ,
                password_confirmation: "dangtung")
  User.create!(name: "admin1",
                email: "admin1@framgia.com",
                password: "dangtung",
                birth_day: '1991-09-20'  ,
                password_confirmation: "dangtung")
  User.create!(name: "admin2",
                email: "admin2@framgia.com",
                password: "dangtung",
                birth_day: '1991-09-20'  ,
                password_confirmation: "dangtung")
  User.create!(name: "admin3",
                email: "admin3@framgia.com",
                password: "dangtung",
                birth_day: '1991-09-20'  ,
                password_confirmation: "dangtung")
  User.create!(name: "admin4",
                email: "admin4@framgia.com",
                password: "dangtung",
                birth_day: '1991-09-20'  ,
                password_confirmation: "dangtung")
  end
end