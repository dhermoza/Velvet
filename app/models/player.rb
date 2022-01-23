class Player < ApplicationRecord
  # include Filterable
  # self.per_page = 20
  validates :nickname, :avatar, :ranking, :status, presence: true
  # scope :in_print, -> { where(out_of_print: false) }
  scope :filter_by_status, ->(status) { where(status: status) }
  # scope :filter_by_status, ->(status) { where status: status }
  scope :order_per_ranking, ->(ranking) { order ranking }
  # scope :desc, order("players.player_at DESC")

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
