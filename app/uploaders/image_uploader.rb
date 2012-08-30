
class ImageUploader < CarrierWave::Uploader::Base

  # Include RMagick or MiniMagick support:
  include CarrierWave::RMagick
  # include CarrierWave::MiniMagick

  # Include the Sprockets helpers for Rails 3.1+ asset pipeline compatibility:
  # include Sprockets::Helpers::RailsHelper
  # include Sprockets::Helpers::IsolatedHelper

  # Choose what kind of storage to use for this uploader:

  storage :fog

  # Override the directory where uploaded files will be stored.
  # This is a sensible default for uploaders that are meant to be mounted:
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end
  
  def cache_dir
  "#{Rails.root}/tmp/uploads"
  end

  # Provide a default URL as a default if there hasn't been a file uploaded:
  # def default_url
  #   # For Rails 3.1+ asset pipeline compatibility:
  #   # asset_path("fallback/" + [version_name, "default.png"].compact.join('_'))
  #
  #   "/images/fallback/" + [version_name, "default.png"].compact.join('_')
  # end

  # Process files as they are uploaded:
  # process :scale => [200, 300]
  #
  # def scale(width, height)
  #   # do something
  # end

  # Create different versions of your uploaded files:

  
  version :micropost do
    process :resize_to_fit => [210,700]
  end
  
  version :lmicropost do
    process :resize_to_fit => [680,2000]
  end

  version :avatar do
    process :resize_to_fill => [55,50]
    process :rounded_corners => [100]
  end
  
  version :lavatar do
    process :resize_to_fill => [180,200]
  end
  
  version :tallavatar do
    process :resize_to_fill => [180,400]
  end
  

  
  def rounded_corners(radius) 
           manipulate! do |img| 
             mask = ::Magick::Image.new(img.columns, img.rows) { 
               self.background_color = 'black' 
             } 

             gc = ::Magick::Draw.new 
             gc.stroke('white').fill('white') 
             gc.roundrectangle(0, 0, img.columns - 1, img.rows - 1, 
   radius, radius) 
             gc.draw(mask) 

             mask.matte = false 
             img.matte = true 

             thumb = img.composite(mask, Magick::CenterGravity, 
   Magick::CopyOpacityCompositeOp) 
             thumb.alpha(Magick::ActivateAlphaChannel) 
             thumb.format = 'png' 

             #thumb.display 
             puts "has alpha? #{thumb.alpha?} and returned 
   #{thumb.inspect}" 
             thumb 
      end
  end

  # Add a white list of extensions which are allowed to be uploaded.
  # For images you might use something like this:
  # def extension_white_list
  #   %w(jpg jpeg gif png)
  # end

  # Override the filename of the uploaded files:
  # Avoid using model.id or version_name here, see uploader/store.rb for details.
  # def filename
  #   "something.jpg" if original_filename
  # end

end
