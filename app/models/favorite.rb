class Favorite
  include Mongoid::Document
  include Mongoid::Timestamps
  has_many :product
  belongs_to :user

  field :product_id, type: String

  validates :product_id, presence:  true 
end
