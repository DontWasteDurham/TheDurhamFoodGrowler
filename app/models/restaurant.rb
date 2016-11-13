class Restaurant < ApplicationRecord
  has_many :transactions
  belongs_to :owner, class_name: "User", optional: true
end
