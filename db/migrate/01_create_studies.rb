class CreateStudies < ActiveRecord::Migration[6.1]
  def change
    create_table :studies do |t|
      t.string :title
      t.integer :semester
      t.integer :year
      t.integer :number
      t.string :biblical_base
      t.integer :user_id

      t.timestamps
    end
  end
end
