class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :validatable, :trackable,
    :lockable, :omniauthable, omniauth_providers: [:google_oauth2]

  before_create :add_collection

  attr_accessor :ranking

  has_one :collection
  has_many :ownerships, through: :collection
  has_many :cards, through: :ownerships
  has_many :tradables
  has_many :tradable_cards, through: :tradables, source: :card
  has_many :received_trades
  has_many :wishes
  has_many :wishlist_items, through: :wishes, source: :card
  has_many :wins, class_name: 'Match', foreign_key: 'winner_id'
  has_many :losses, class_name: 'Match', foreign_key: 'loser_id'

  scope :unlocked, -> { self.where(locked_at: nil) }

  def matches
    Match.where("winner_id = ? OR loser_id = ?", id, id)
  end

  def wishlist
    wishlist_items
  end

  def trades_received_and_allowed_by_rarity
    trades = [];
    ReceivedTrade::NUM_PER_PACK_BY_RARITY.keys.each do |rarity|
      num_allowed = ReceivedTrade.num_allowed(rarity, id)
      received = received_trades.where(rarity: rarity).first
      num_received = received ? received.num_received : 0
      trades << {:rarity => rarity, :num_received => num_received, :num_allowed => num_allowed}
    end
    trades
  end

  def to_s
    email
  end

  def self.from_omniauth(access_token)
    data = access_token.info
    user = User.where(email: data['email']).first

    # Uncomment the section below if you want users to be created if they don't exist
    unless user
      user = User.create(name: data['name'],
                         email: data['email'],
                         password: Devise.friendly_token[0,20]
                        )
    end
    user
  end

  def gravatar_path
    hash = Digest::MD5.hexdigest(self.email.downcase) if self.email
    image_src = "https://www.gravatar.com/avatar/#{hash}"
  end

  private

  def add_collection
    self.collection = Collection.new
  end

end
