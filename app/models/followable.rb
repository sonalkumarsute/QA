class Followable < ApplicationRecord
  has_many :follows

  # def following
  #   self.followers
  # end   

end
