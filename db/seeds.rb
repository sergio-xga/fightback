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
    beneficiary: Faker::University.prefix + ' ' + Faker::FunnyName.name + ' ' + Faker::University.suffix,
    project_owner_id: nil,
    description: Faker::Hipster.paragraph(sentence_count: 2, supplemental: true, random_sentences_to_add: 4),
    goal_amount: Faker::Number.between(from: 1000, to: 100000),
    goal_deadline: Faker::Date.forward(days: 365),
    project_status: 'active'
  )
end

Project.all.each do |project|
  3.times do
    pre = rand(2)+1
    suf = rand(4)+1
    puts "Project: #{project.id}"
    puts "project_#{pre}_#{suf}.jpg"
    project.images.attach(
      io: File.open(Rails.root.to_s + "/app/assets/images/project_#{pre}_#{suf}.jpg"),
      content_type: 'image/jpeg',
      filename: "project_#{pre}_#{suf}.jpg,",
      identify: false
    )
    # SQLite3::BusyException: database is locked
    sleep 2
  end
  10.times do
    t_statuses = ['in_transit','cancelled','complete', nil, nil]
    Donation.create(
      amount: Faker::Number.between(from: 10, to: 500),
      payment_method: 'paypal',
      project_id: project.id,
      transaction_status: t_statuses[rand(5)] || 'complete'
    )
  end
end
