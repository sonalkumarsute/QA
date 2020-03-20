class User < ApplicationRecord
  has_many :follower_relationships, foreign_key: :following_id, class_name: "Follow"
  has_many :followers, through: :follower_relationships, source: :follower  
  has_many :questions  
  has_many :answers 
  #has_many :topics
# Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


  def following
    ids = Follow.where(user_id: self.id, following_type: "User").pluck(:following_id)
    User.where(id: ids)
  end  

  def topics
    ids = Follow.where(user_id: self.id, following_type: "Topic").pluck(:following_id)
    Topic.where(id: ids)
  end  

end
