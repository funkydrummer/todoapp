class RenameSongsToItems < ActiveRecord::Migration
  def change
    rename_table :songs, :items
  end
end
