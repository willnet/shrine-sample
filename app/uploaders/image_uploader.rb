class ImageUploader < Shrine
  plugin :validation_helpers

  Attacher.validate do
    validate_max_size 5.megabytes
    validate_mime_type_inclusion ['image/jpeg']
  end
end
