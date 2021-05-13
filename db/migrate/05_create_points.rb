class CreatePoints < ActiveRecord::Migration[6.1]
  def change
    create_table :points do |t|
      t.string :name
      t.integer :subtitle_id
      t.timestamps
    end
  end
end
