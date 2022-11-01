class Order
  include Mongoid::Document
  include Mongoid::Timestamps
  field :quantity, type: Integer
  belongs_to :product
  belongs_to :user
end
