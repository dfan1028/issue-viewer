class AddRepositoryTable < ActiveRecord::Migration[6.0]
  def change
    create_table :repositories do |t|
      t.string :full_name, null: false
      t.string :remote_id, null: false
      t.integer :user_id,  null: false

      t.timestamps default: -> { 'CURRENT_TIMESTAMP' }
    end

    add_index :repositories, :user_id
    add_index :repositories, :remote_id, unique: true
  end
end
