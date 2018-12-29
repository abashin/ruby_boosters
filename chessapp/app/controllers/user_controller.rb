class UserController < ApplicationController
  before_action :set_champions

  def game
  end

  def main_menu
  end

  def set_champions
    @champions ||= %w(Алехин Ботвинник Смыслов Таль)
    @enemy = @champions.sample
    @champions = @champions.delete_if {|x| x== @enemy}
  end

  def champions
  end

  def new_player

  end

  def create_player

  end

  def show
    @player = Player.find_by(id: params[:id])
    if @player.nil?
      redirect_to root_path
    end
  end

  def set_players
    @players = Player.all
  end

end
