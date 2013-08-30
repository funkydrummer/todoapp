class AddIsDeletableColumnToSongs < ActiveRecord::Migration
  def change
    add_column :songs, :is_deletable, :boolean, default: true
  end
end
