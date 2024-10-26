require "sinatra"
require "sinatra/reloader"

get("/") do
  erb(:homepage)
end

get("/process_roll?dice=:number_of_dice&sides=:how_many_sides") do
  @dice = params.fetch("number_of_dice").to_i
  @sides = params.fetch("how_many_sides").to_i

  @rolls = []

  @dice.times do
    die = rand(1..@sides)

    @rolls.push(die)
  end

  erb(:roll)
end
