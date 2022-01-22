class Player < ApplicationRecord
  validates :nickname, :avatar, :ranking, :status, presence: true
  
  scope :filter_by_status, -> (status) { where status: status }
  scope :order_per_ranking, -> (ranking) { order ranking }
<<<<<<< HEAD

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
=======
  
>>>>>>> 91b8f853d5bbd1a6155636024365adcf8bd274fd
end
