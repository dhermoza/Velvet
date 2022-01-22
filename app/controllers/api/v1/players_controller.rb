class Api::V1::PlayersController < Api::V1::BaseController
  before_action :set_player, only: [ :show, :update, :destroy ]

  def index
    if params[:query].present?
    
      query = " \
        players.id LIKE :query \
        OR players.nickname LIKE :query \
        OR players.status LIKE :query \
      "
      @players = Player.where(query, query: "%#{params[:query]}%").order("ranking DESC")
    elsif params[:query].present?
      sql_query = "player.id LIKE :query"
      @players = Player.where(sql_query, query: params[:query])
    elsif params[:status].present?
      @players = Player.filter_by_status(status: params[:status]) 
    elsif params[:ranking].present?
      @players = Player.order_per_ranking(ranking: params[:ranking])
    else
      @players = Player.all.order("ranking DESC")
    end  
  end

  def show
  end

  def update
    if @player.update(player_params)
      render :show
    else
      render_error
    end
  end

  def create
    @player = Player.new(player_params)
    if @player.save
      render json: @player
    else
      render_error
    end
  end

  def destroy
    @player.destroy
    head :no_content
  end

  private


  def set_player
    @player = Player.find(params[:id])
  end

  def player_params
    params.require(:player).permit(:nickname, :avatar, :status, :ranking)
  end

  def filtering_params(params)
    params.slice(:status, :ranking, :query)
  end

  def render_error
    render json: { errors: @player.errors.full_messages },
      status: :unprocessable_entity
  end

end
