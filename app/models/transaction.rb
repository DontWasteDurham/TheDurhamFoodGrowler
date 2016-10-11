class Transaction < ApplicationRecord

  belongs_to :user
  belongs_to :restaurant
  validates :user_id, presence: true
  validates :restaurant_id, presence: true
  validates :number_of_boxes, presence: true
  validates :restaurant_id, presence: true

end
