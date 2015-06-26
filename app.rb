require_relative 'config/environment'

class GameApp < Sinatra::Base
  get '/rps/:play' do
    # Your app code goes here
    @rps_game = RPSGame.new(:rock)
    erb :rps_game
  end
end
