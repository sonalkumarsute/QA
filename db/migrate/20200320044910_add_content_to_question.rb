class AddContentToQuestion < ActiveRecord::Migration[5.1]
  def change
    add_column :questions, :content, :text
  end
end
