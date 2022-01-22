class Player < ApplicationRecord
  validates :nickname, :avatar, :ranking, :status, presence: true

  scope :filter_by_status, -> (status) { where status }
  scope :order_per_ranking, -> (ranking) { order ranking }

  STATUS = [
    ['Todos',nil],
    ['Oro',"oro"],
    ['Plata','plata'],
    ['Bronce','bronce'],
  ]

  RANKING = [
    ['Todos',nil],
    ['Mayor puntaje','desc'],
    ['Menor puntaje','asc'],
  ]
end
