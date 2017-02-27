class AddcolumnuserIdtoannonces < ActiveRecord::Migration
  def self.up
    change_table :annonces do |t|
      t.integer :user_id
    end
  end  
end
