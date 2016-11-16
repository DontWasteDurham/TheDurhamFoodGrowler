class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :transactions
  has_many :restaurants, foreign_key: "owner_id"

  def full_name
    "#{first_name} #{last_name}"
  end

  def subtract_from_box_status(number_of_boxes)
    self.box_status -= number_of_boxes
    save!
  end

  def add_to_box_status(number_of_boxes)
    self.box_status += number_of_boxes
    save!
  end

  def has_enough_boxes?(number_of_boxes)
    true if (purchased_boxes >= (box_status + number_of_boxes))
  end

  def can_return?(number_of_boxes)
    true if (purchased_boxes >= (box_status - number_of_boxes))
  end
end
