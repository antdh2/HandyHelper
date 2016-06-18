class Task < ActiveRecord::Base

  # has_attached_file :image, styles: {
  #     medium: "400x400>",
  #     thumb: "100x100>" }
  # validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/

  mount_uploader :image, ImageUploader

  validates :name, :description, :price, presence: true
  validates :price, numericality: { greater_than: 0 }

  # validate presence of an image on task
  # validates_attachment_presence :image

  belongs_to :user

end
