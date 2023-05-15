class Room < ApplicationRecord
  
  belongs_to :user,optional: true
  has_many :reservations, dependent: :destroy
  
  mount_uploader :image, ImageUploader

  with_options presence: true do
    validates :roomname
    validates :detail
    validates :price
    validates :address
  end
  
  validates :price,numericality: {only_integer: true,greater_than_to: 0}


  def self.search_area(area)
     where(["address like?", "%#{area}%"])  
  end
 
  def self.search(keyword) 
    where(["roomname like? OR detail like?","%#{keyword}%","%#{keyword}%"]) 
  end
  
  
  
  def self.ransackable_attributes(auth_object = nil)
  ["address", "created_at", "detail", "id", "image", "image_cache", "price", "roomname", "updated_at", "user_id","reservations", "user"]
  end 

  def self.ransackable_associations(auth_object = nil)
  ["reservation", "user"]
  end 

end

