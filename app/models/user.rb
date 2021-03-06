class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  has_many :likes, :dependent => :destroy
  
  mount_uploader :image, ImageUploader

  validates :name, presence: true, length: { maximum: 8 }
end
