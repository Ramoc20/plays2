class TeamsController < ApplicationController
  before_action :set_category

  def show
    @team = Team.friendly.find(params[:slug])
  end
  

  private

  def set_category
    @category = Category.find_by!(name: params[:category])
  end
end
