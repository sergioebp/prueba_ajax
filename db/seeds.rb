# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
AdminUser.destroy_all
AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?
User.destroy_all
Company.destroy_all

20.times do
    Company.create(name: Faker::Company.unique.name)
end

30.times do
    User.create(email: Faker::Internet.unique.email, password: '123456')
end

250.times do
    Claim.create(content: Faker::Lorem.sentence(3, true, 4), user: User.all.sample, company: Company.all.sample)
end