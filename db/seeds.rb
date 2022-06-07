# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require 'csv'
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts 'Cleaning database'
Expression.destroy_all

puts 'parsing CSV seeds'
csv_text = File.read(Rails.root.join('lib', 'seeds', 'expresiones-cl.csv'))
csv = CSV.parse(csv_text, :headers => true)

puts 'Looping through the parsed data to create expressions'
csv.each do |row|
  Expression.create!(
    sentence: "#{row['Sentence']}",
    definition: "#{row['Definition']}"
  )
end
puts 'All expressions created'
