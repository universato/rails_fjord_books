# frozen_string_literal: true

class Book < ApplicationRecord
  # mount_uploader :picture, PictureUploader
  validates :title, presence: true
  paginates_per 10
end
