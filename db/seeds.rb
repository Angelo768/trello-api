# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create!(email: "teste@teste.com", password: "teste1234")

5.times do |board|
    Board.create!(
        user_id: 1, 
        name: Faker::Game.title
    )
end

15.times do |task|
    Task.create!(
        list_id: task + 1, 
        name: %w[Passar_para_Plataforma Novo_Design Testes].sample, 
        description: Faker::Lorem.paragraph(
            sentence_count: 2, 
            supplemental: false, 
            random_sentences_to_add: 4)
    )
end