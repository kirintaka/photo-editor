class WebPagesController < ApplicationController
  def index
    @image = Image.new
  end

  def form
    @image = Image.find(params[:id])
  end
end
