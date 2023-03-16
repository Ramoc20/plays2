class PlayersController < ApplicationController
  before_action :set_player, only: [:show, :edit, :update, :destroy]
  # Add this line to skip the :set_player method for the search_results action
  skip_before_action :set_player, only: [:search_results]

  def show
    @career_data = CareerData.where(player_id: @player.id)
    @career_data = CareerData.where(player_id: @player.id).order(:season)
    @contract_info = NbaContractInfo.find_by(player_id: @player.id)
    @nba_salary_proj = @player.nba_salary_proj.order(:season)
  end

  def search
    query = params[:q]
    @players = Player.where("LOWER(name) LIKE ?", "%#{query.downcase}%")
    render 'index'
  end

  def search_results
    puts "DEBUG: search_results called"
    query = params[:q].downcase
    @nba_players = Player.where('LOWER(name) LIKE ?', "%#{query}%").limit(10)
    @mlb_players = MlbPlayer.where('LOWER(name) LIKE ?', "%#{query}%").limit(10)
  
    @players = @nba_players + @mlb_players
  
    render json: @players.to_json(only: [:name, :slug, :image], methods: [:player_type])
  end
  
  
  

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_player
    @player = Player.find_by(slug: params[:id])
    if @player.nil?
      redirect_to root_path, alert: "Player not found."
    end
  end
end
