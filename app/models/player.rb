class Player < ApplicationRecord
  validates :nickname, :avatar, :ranking, :status, presence: true

  STATUS = [
    ['Todos',nil],
    ['Oro','oro'],
    ['Plata','plata'],
    ['Bronce','bronce'],
  ]

  RANKING = [
    ['Todos',nil],
    ['Mayor puntaje','desc'],
    ['Menor puntaje','asc'],
  ]
end
