class CreateAnnonces < ActiveRecord::Migration
  def change
    create_table :annonces do |t|
      t.string :title
      t.text :description
      t.integer :price
      t.integer :category_id

      t.timestamps null: false
    end
    add_attachment :annonces, :image
  end
end
