class PlayersController < ApplicationController

  def index
    @players = Player.all
    @status_list = ["oro", "bronce", "plata", "Oro", "Plata", "Bronce"]
    if params[:status].present?
      @players = Player.where(status: params[:status])
    elsif params[:ranking].present?
      @players = Player.order(ranking: params[:ranking])
    end
  end

  def show
    @player = Player.find(params[:id])
  end

  def new
    @player = Player.new
  end

  def create
    @player = Player.new(player_params)
    if @player.save
      redirect_to players_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @player = Player.find(params[:id])
  end

  def update
    @player = Player.find(params[:id])

    if @player.update(player_params)
      redirect_to @player
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @player = Player.find(params[:id])
    @player.destroy
    redirect_to players_path
  end

  private

  def player_params
    params.require(:player).permit(:nickname, :avatar, :status, :ranking)
  end
end
