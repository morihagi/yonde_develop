# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ProgramSegment.create!(
  email: 'ado@allnightnippon.com',
  program: 'Adoのオールナイトニッポン',
  segment: 'Adoレナリン'
)

30.times do
  Profile.create!(
    email_for_post: Faker::Internet.email,
    prefecture: Faker::Address.state,
    city: Faker::Address.city,
    radio_name: Faker::Name.name,
    zip1: Faker::Number.between(from: 100, to: 999),
    zip2: Faker::Number.between(from: 1000, to: 9999),
    other_address: Faker::Address.street_address,
    legal_name: Faker::Name.name,
    user_id: User.pluck(:id).sample
  )
end

30.times do
  Post.create!(
    email_for_post: Faker::Internet.email,
    prefecture: Faker::Address.state,
    city: Faker::Address.city,
    radio_name: Faker::Name.name,
    zip1: Faker::Number.between(from: 100, to: 999),
    zip2: Faker::Number.between(from: 1000, to: 9999),
    other_addess: Faker::Address.street_address,
    legal_name: Faker::Name.name,
    favorite_status: 'unlike',
    post_status: 'draft',
    body: Faker::Lorem.paragraph(sentence_count: 5),
    user_id: User.pluck(:id).sample,
    program_segment_id: 1
  )
end
