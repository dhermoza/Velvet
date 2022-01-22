class Player < ApplicationRecord
  validates :nickname, :avatar, :ranking, :status, presence: true
  
  scope :filter_by_status, -> (status) { where status: status }
  scope :order_per_ranking, -> (ranking) { order ranking }
  
end
