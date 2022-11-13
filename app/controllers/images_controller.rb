class ImagesController < ApplicationController
  def index
    @image = Image.new
  end

  def upload
    @image = Image.new(resume_params)

    if @image.save
      redirect_to @image, notice: "The image has been uploaded."
    else
      redirect_to '/error'
    end
  end

  def show
    @image = Image.find(params[:id])
  end

  private
    def resume_params
      params.require(:image).permit(:image)
    end
end
