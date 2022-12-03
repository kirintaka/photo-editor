class ImagesController < ApplicationController
  def create
    @image = Image.new(resume_params)

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

    flash[:success] = "The to-do item was successfully destroyed."

    redirect_to @image
  end

  def delete
    @image = Image.find(params[:id])
    @image.remove_image! if params[:remove_image].present?
    @image.save

    flash[:success] = "The to-do item was successfully destroyed."
    redirect_to @image
  end

  def rotate
    @image = Image.find(params[:id])
    @image.update_column(:image, File.basename(params[:image]))
    @image.image.recreate_versions!

    redirect_to @image
  end

  private
  
    def resume_params
      params.require(:image).permit(:image)
    end
end
