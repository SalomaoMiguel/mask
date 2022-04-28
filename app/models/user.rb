class User < ApplicationRecord
  has_many :posts
  #Seguidores Seguidos
  has_many :followers_subscriptions, foreign_key: :followed_id, class_name: "Subscription"
  has_many :followers, through: :followers_subscriptions, source: :followed_by
  
  #Seguidores que Seguem 
  has_many :following_subscriptions, foreign_key: :followed_by_id, class_name: "Subscription"
  has_many :following, through: :following_subscriptions, source: :followed

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  validates :phone, :name, :avatar,  presence: true
  
  has_one_attached :avatar
end
