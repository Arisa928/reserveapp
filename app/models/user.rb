class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  mount_uploader :profileimage,ProfileimageUploader
  has_many :rooms, dependent: :destroy
  has_many :reservations, dependent: :destroy

  def already_reservated?(user)
    self.reservations.exists?(room_id: room.id)
  end       
   
  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "email", "encrypted_password", "id", "profile", "profileimage", "remember_created_at", "reset_password_sent_at", "reset_password_token", "updated_at", "username"]
  end      
  
  def self.ransackable_associations(auth_object = nil)
    ["reservations", "rooms"]
  end
         
end
