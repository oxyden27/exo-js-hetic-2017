class RemoveUserIdfromCategories < ActiveRecord::Migration
  def change
    remove_column :categories, :user_id
  end
end

