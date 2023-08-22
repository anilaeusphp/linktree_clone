class ApplicationController < ActionController::Base

  before_action :set_navbar_should_render

  private
  def set_navbar_should_render
    @navbar_should_render = false
  end
end
