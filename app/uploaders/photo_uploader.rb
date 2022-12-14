class PhotoUploader < CarrierWave::Uploader::Base
  # Include RMagick or MiniMagick support:
  # include CarrierWave::RMagick
  include CarrierWave::MiniMagick

  # Choose what kind of storage to use for this uploader:
  storage :file
  # storage :fog

  # Override the directory where uploaded files will be stored.
  # This is a sensible default for uploaders that are meant to be mounted:
  def store_dir
    "uploads/#{mounted_as}/#{model.id}"
  end

  # Provide a default URL as a default if there hasn't been a file uploaded:
  # def default_url(*args)
  #   # For Rails 3.1+ asset pipeline compatibility:
  #   # ActionController::Base.helpers.asset_path("fallback/" + [version_name, "default.png"].compact.join('_'))
  #
  #   "/images/fallback/" + [version_name, "default.png"].compact.join('_')
  # end

  # Process files as they are uploaded:
  # process scale: [200, 300]
  #
  # def scale(width, height)
  #   # do something
  # end

  # Create different versions of your uploaded files:
  version :thumb do
    process resize_to_fit: [1200, 700]
  end

  version :small do
    process resize_to_fit: [200, 200]
  end

  version :big do
    process resize_to_fit: [1000, 1000]
  end

  version :left do
    process :rotate_left
  end

  version :right do
    process :rotate_right
  end

  version :bordered do
    process :add_border
  end

  # Add an allowlist of extensions which are allowed to be uploaded.
  # For images you might use something like this:
  def extension_allowlist
    %w(jpg jpeg gif png)
  end

  def content_type_allowlist
    /image\//
  end

  private
    def rotate_left
      manipulate! do |img|
        img.rotate "-90"
        img
      end
    end

    def rotate_right
      manipulate! do |img|
        img.rotate "90"
        img
      end
    end

    def add_border
      manipulate! do |img|
        img.border 10
        img
      end
    end

  # Override the filename of the uploaded files:
  # Avoid using model.id or version_name here, see uploader/store.rb for details.
  # def filename
  #   "something.jpg" if original_filename
  # end
end
