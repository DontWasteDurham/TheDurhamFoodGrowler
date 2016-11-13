class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :transactions
  has_many :restaurants, class_name: "User", foreign_key: "owner_id"

  def full_name
    "#{first_name} #{last_name}"
  end
end
