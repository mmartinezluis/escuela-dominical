class AddNameToSubtitles < ActiveRecord::Migration[6.1]
  def change
    add_column :subtitles, :name, :string
  end
end
