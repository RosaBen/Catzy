class Item < ApplicationRecord
  validates :description, length: { maximum: 500 }
  validates :title, length: { maximum: 20 }
  validates :price, :image_url, :title, presence: true
  validates :price, numerically: { greater_than: 0 }
end
