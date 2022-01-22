class Player < ApplicationRecord
  include Filterable
  validates :nickname, :avatar, :ranking, :status, presence: true

  scope :filter_by_status, -> (status) { where status: status }
  scope :order_per_ranking, -> (ranking) { order ranking }

  # QUERY = " \
  #     players.id @@ :query \
  #     OR players.nickname @@ :query \
  #     OR players.status @@ :query \
  #   "
  # scope :search_by_player, -> (query) {

  #   where(QUERY, query: "%#{params[:query]}%").order("ranking ASC")
  # }





  # pagination and order per ranking search for nickname and/or status
  # pg_search_scope :search_by_player,
  #   against: [ :nickname, :status, :id ],
  #   using: {
  #     tsearch: { prefix: true }
  #   }


end
