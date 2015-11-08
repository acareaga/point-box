class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username
      t.string :first_name
      t.string :last_name
      t.string :top_destination
      t.integer :points_available,  default: 10000
      t.integer :points_redeemed,   default: 0
      t.integer :role,              default: 0
      t.string :password_digest

      t.timestamps null: false
    end
  end
end
