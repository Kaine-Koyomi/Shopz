class Product
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Paperclip
  
  field :title, type: String
  field :description, type: String
  field :price, type: Float
  belongs_to :seller
  has_many :comments
  has_one :orders

  paginates_per 4

  has_mongoid_attached_file :photo
  validates_attachment_content_type :photo, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]


  def self.search(search)
    if search
      any_of({title: /#{search}/i},{description: /#{search}/i})
    end
  end

end
