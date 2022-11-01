class Comment
  include Mongoid::Document
  include Mongoid::Timestamps
  field :body, type: String
  belongs_to :product
  belongs_to :user

  validates :body, presence: true
end
