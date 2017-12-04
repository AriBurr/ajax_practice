class CharactersController < ApplicationController
  layout false
  before_action :set_game
  before_action :set_character, except: [:index, :create]
  skip_before_action :verify_authenticity_token, except: [:show, :index]

  def index
    render json: @game.characters
                # { game_name: @game.name, characters: @game.characters }
                # example repsonse: {game_name: 'Zelda', characters: [{}, {}, {}] }
  end

  def show
  end

  def create
  end

  def update
  end

  def destroy
    name = @character.name
    @character.destroy
    render json: { message: "#{name} was deleted!" }
  end

  private

  def set_game
    @game = Game.find(params[:game_id])
  end

  def set_character
    @character = @game.characters.find(params[:id])
  end

  def character_params
    params.require(:character).permit(:name, :power)
  end

end
