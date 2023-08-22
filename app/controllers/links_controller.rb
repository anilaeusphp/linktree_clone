class LinksController < ApplicationController
  before_action :authenticate_user!
  before_action :link_params, only: [:update]
  before_action :set_link, only: [:update]
  def index
  end

  def update
    if @link.update(link_params)
      redirect_to dashboard_path, notice: "Link has been added"
    end
  end

  private
  def set_link
    @link = Link.find(params[:id])
  end

  private
  def link_params
    params.require(:link).permit(:title, :url)
  end
end
