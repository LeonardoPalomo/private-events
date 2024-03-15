class CreatorsController < ApplicationController
  before_action :authenticate_user!

  def show
    @creator = set_creator
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_creator
    @creator = User.find(params[:id])
  end

end
