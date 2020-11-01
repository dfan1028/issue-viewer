class AddIssueTable < ActiveRecord::Migration[6.0]
  def change
    create_table :issues do |t|
      t.string  :title
      t.string  :author
      t.integer :repository_id,     null: false
      t.string  :remote_id,         null: false
      t.string  :remote_created_at
      t.text    :description

      t.timestamps default: -> { 'CURRENT_TIMESTAMP' }
    end

    add_index :issues, [:repository_id, :remote_id], length: 25, unique: true
  end
end
