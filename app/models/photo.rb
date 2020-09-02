class Photo < ApplicationRecord
  acts_as_taggable_on :tags

  belongs_to :user

  has_one_attached :thumbnail

end
