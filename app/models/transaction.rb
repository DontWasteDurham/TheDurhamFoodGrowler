class Transaction < ApplicationRecord
  belongs_to :user
  belongs_to :restaurant
  validates :restaurant_id, presence: true
  validates :number_of_boxes, presence: true
  validates :restaurant_id, presence: true
  validates_presence_of :taken_or_returned?


  def taken?
    taken
  end

  def returned?
    returned
  end

  def taken_or_returned?
    true if taken? || returned?
  end


end
