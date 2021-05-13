class CreateNotes < ActiveRecord::Migration[6.1]
  def change
    create_table :notes do |t|
      t.text :details
      t.integer :point_id
      t.timestamps
    end
  end
end
