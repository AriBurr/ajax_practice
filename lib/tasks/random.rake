namespace :random do
  desc "Seed Random Games And Characters For Development"
  task games: :environment do
    20.times do
      game = Game.create(name: Faker::Zelda.game, description: Faker::Lorem.sentence)
      5.times do
        game.characters.create(name: Faker::Zelda.character, power: Faker::Superhero.power)
      end
    end
    puts "Game Data Seeded! Number Of Game: #{Game.count}. Number Of Characters: #{Character.count}"
  end
end
