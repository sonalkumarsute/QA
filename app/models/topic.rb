class Topic < ApplicationRecord
  #belongs_to :user
  #has_many :follower_relationships, foreign_key: :following_id, class_name: "Follow"
  #has_many :followers, through: :follower_relationships, source: :follower    
  has_many :followers, :as => :follow
end
