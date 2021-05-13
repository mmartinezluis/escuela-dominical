class CreateSubtitles < ActiveRecord::Migration[6.1]
  def change
    create_table :subtitles do |t|
      t.integer :study_id
    end
  end
end
