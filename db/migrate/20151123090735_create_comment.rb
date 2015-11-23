class CreateComment < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.integer :candidate_id
      t.boolean :status
      t.string :title
      t.text :message
      t.timestamps null: false
    end
  end
end
