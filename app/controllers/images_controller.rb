class ImagesController < ApplicationController
  def create
    @image = Image.new(image_params)

    if @image.save
      redirect_to @image, notice: 'The image has been uploaded.'
    else
      render 'images/error'
    end
  end

  def show
    @image = Image.find(params[:id])
  end

  def update
    @image = Image.find(params[:id])
    @image.update(image: params[:image][:image]) if params[:image][:image].present?

    redirect_to @image
  end

  def delete
    @image = Image.find(params[:id])
    @image.remove_image! if params[:remove_image].present?
    @image.save

    redirect_to @image
  end

  def edit
    @image = Image.find(params[:id])
    @image.update_column(:image, File.basename(params[:image]))
    @image.image.recreate_versions!

    redirect_to @image
  end

  private
    
    def image_params
      params.require(:image).permit(:image)
    end
end
