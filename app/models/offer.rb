class Offer < ActiveRecord::Base

  validates :price, numericality: { greater_than: 0 }

  belongs_to :task
  belongs_to :buyer, class_name: "User"
  belongs_to :seller, class_name: "User"
end
