class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.integer :user_id
      t.text :street
      t.string :city
      t.integer :pin
      t.string :title

      t.timestamps null: false
    end
  end
end
