class GamesController < ApplicationController
  before_action :set_game, except: [:index, :create]

  def index
    @games = Game.all
  end

  def show
  end

  def create
    @game = Game.new(game_params)
    if @game.save
      # Example Response: { id: 1, name: 'Zelda', description: 'ipsum lorem' }
      render json: @game
    else
      render_error(@game)
    end
  end

  def update
    if @game.update(game_params)
      render json: @game
    else
      render_error(@game)
    end
  end

  def destroy
    name = @game.name
    @game.destroy
    render json: { message:  "Game: #{name} Deleted" }
  end

  private
    def set_game
      @game = Game.find(params[:id])
    end

    def game_params
      params.require(:game).permit(:name, :description)
    end

end
