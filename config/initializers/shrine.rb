require 'shrine'
require 'shrine/storage/file_system'

Shrine.storages = {
  cache: Shrine::Storage::FileSystem.new(
    'public', prefix: 'uploads/cache'
  ),
  store: Shrine::Storage::FileSystem.new(
    'public', prefix: 'uploads/store'
  )
}

Shrine.plugin :cached_attachment_data
Shrine.plugin :activerecord
Shrine.plugin :determine_mime_type
Shrine.plugin :backgrounding
Shrine::Attacher.promote { |data| PromoteJob.perform_later(data) }
Shrine.plugin :direct_upload
