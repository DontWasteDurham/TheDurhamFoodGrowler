class Transaction < ApplicationRecord

  transaction belongs_to :user
  transaction belongs_to :restaurant
  validates number_of_boxes, presence: true
  validates returned_or_taken
  validates restaurant_id, presence: true
  validates user_id, presence: true


end
