class Player < ApplicationRecord
  validates :nickname, :avatar, :ranking, :status, presence: true
end
