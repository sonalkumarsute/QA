class AddFollowingTypeToFollow < ActiveRecord::Migration[5.1]
  def change
    add_column :follows, :following_type, :string
  end
end
