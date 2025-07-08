class Item < ApplicationRecord
  validates :description, length: { maximum: 500 }
  validates :title, length: { maximum: 30 }
  validates :price, :image_url, :title, presence: true
  validates :price, numericality: { greater_than: 0 }
end
