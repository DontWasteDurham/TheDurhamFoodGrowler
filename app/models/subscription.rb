class Subscription < ApplicationRecord

  def how_many_boxes?
    quantity = self - 20
    quantity / 5
  end
end
