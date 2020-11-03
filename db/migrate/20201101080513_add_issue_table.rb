class AddIssueTable < ActiveRecord::Migration[6.0]
  def change
    create_table :issues do |t|
      t.string  :title
      t.string  :author
      t.integer :number
      t.integer :repository_id,     null: false
      t.string  :remote_id,         null: false
      t.string  :remote_created_at
      t.text    :description

      t.timestamps default: -> { 'CURRENT_TIMESTAMP' }
    end

    add_index :issues, :repository_id
    add_index :issues, :remote_id, unique: true
  end
end
