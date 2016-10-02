class Event < ApplicationRecord
  include ImageUploader[:image]
  validates :name, presence: true
end
