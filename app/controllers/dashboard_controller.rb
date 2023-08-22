class DashboardController < ApplicationController
  before_action :authenticate_user!, except: [:show]
  before_action :must_render
  before_action :set_user, only: [:show, :appearence]
  def index
  end

  def show
    redirect_to dashboard_index_path, alert: "No such user" if @user.nil?
  end

  def appearence

  end


  private
  def must_render
     @should_render_navbar = true
  end

  private
  def set_user
    @user = User.find_by_id(params[:id])
  end
end
