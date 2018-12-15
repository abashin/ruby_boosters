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
  def show
    @user = Player.find(params[:id])
  end
end
