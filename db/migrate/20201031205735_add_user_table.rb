class AddUserTable < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :uid,      null: false
      t.string :platform, null: false
      t.string :image_url
      t.string :auth_token

      t.timestamps
    end

    add_index :users, [:platform, :uid], length: 25, unique: true
  end
end
