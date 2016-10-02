require 'image_processing/mini_magick'

class ImageUploader < Shrine
  include ImageProcessing::MiniMagick

  plugin :validation_helpers
  plugin :processing

  Attacher.validate do
    validate_max_size 5.megabytes
    validate_mime_type_inclusion ['image/jpeg']
  end

  process(:store) do |io, context|
    resize_to_limit(io.download, 700, 700)
  end
end
