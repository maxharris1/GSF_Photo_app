require 'elasticsearch/model'
class Photo < ApplicationRecord
  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks
  acts_as_taggable_on :tags

  settings index: { number_of_shards: 1 }do
    mappings dynamic: false do
      indexes :caption, type: :text, analyzer: :english
      indexes :tags, type: :text, analyzer: :english
      indexes :published, type: :boolean
      end
  end

  belongs_to :user

  has_one_attached :thumbnail


  validate :thumbnail_format
  def resize_image
    resized_image = MiniMagick::Image.read(thumbnail.download)
    resized_image = resized_image.resize "400x400"
    v_filename = thumbnail.filename
    v_content_type = thumbnail.content_type
    thumbnail.purge
    thumbnail.attach(io: File.open(resized_image.path), filename:  v_filename, content_type: v_content_type)
  end
  private
  def thumbnail_format
    return unless thumbnail.attached?
    if thumbnail.blob.content_type.start_with? 'image/'
      if thumbnail.blob.byte_size > 10.megabytes
        errors.add(:thumbnail, 'size needs to be less than 10MB')
        thumbnail.purge
      else
        resize_image
      end
    else
      thumbnail.purge
      errors.add(:thumbnail, 'needs to be an image')
    end
  end

end

Photo.__elasticsearch__.client.indices.delete index: Photo.index_name rescue nil

# Create the new index with the new mapping
Photo.__elasticsearch__.client.indices.create \
  index: Photo.index_name,
  body: { settings: Photo.settings.to_hash, mappings: Photo.mappings.to_hash }

 #Index all article records from the DB to Elasticsearch
Photo.import(force: true)