class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :fname
      t.string :lname
      t.date :bdate
      t.string :email

      t.timestamps null: false
    end
  end
end
