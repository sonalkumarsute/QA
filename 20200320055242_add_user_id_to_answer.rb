class AddUserIdToAnswer < ActiveRecord::Migration[5.1]
  def change
    add_column :answers, :user, :integer
  end
end

