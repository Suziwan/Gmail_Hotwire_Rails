# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require 'faker'

Email.destroy_all

5.times do
  Email.create!(object: Faker::GreekPhilosophers.name,
              body: Faker::GreekPhilosophers.quote)
end