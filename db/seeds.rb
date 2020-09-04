# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
20.times do 
  Project.create(
    name: Faker::Hipster.sentence(word_count: 3),
    beneficiary: Faker::University.prefix + Faker::FunnyName.name + Faker::University.suffix,
    project_owner_id: nil,
    description: Faker::Hipster.paragraph(sentence_count: 2, supplemental: true, random_sentences_to_add: 4),
    goal_amount: Faker::Number.between(from: 1000, to: 1000000),
    goal_deadline: Faker::Date.forward(days: 365),
    project_status: 'active'
  )
end