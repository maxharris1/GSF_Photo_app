require 'elasticsearch/model'
class Photo < ApplicationRecord
  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks
  acts_as_taggable_on :tags

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

Photo.import