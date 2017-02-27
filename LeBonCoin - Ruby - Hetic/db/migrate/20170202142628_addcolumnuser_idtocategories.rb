class AddcolumnuserIdtocategories < ActiveRecord::Migration
  def self.up
    change_table :categories do |t|
      t.integer :user_id
    end
  end
end