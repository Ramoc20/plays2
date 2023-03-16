class MlbPlayersController < ApplicationController
   def show
     @mlb_player = MlbPlayer.friendly.find(params[:id])
   end
 end
 