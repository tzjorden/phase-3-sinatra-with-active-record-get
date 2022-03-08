class ApplicationController < Sinatra::Base

  get '/' do
    { message: "Hello world" }.to_json
  end

  get '/games' do
    # get all the games from the database
    games = Game.all
    # games = Game.all.order(:title) returns only games title 
    # games = Game.all.limit(5) returns first 5 games
    # return a JSON response with an array of all the game data
    games.to_json
  end

  get '/games/:id' do
    # look up the game in the database using its ID
    game = Game.find(params[:id])
    # send a JSON-formatted response of the game data
    game.to_json
  end

  get '/games/:id' do
    game = Game.find(params[:id])

    # display reviews in the JSON response
    game.to_json(include: { reviews: { include: :user } })
  end

end
