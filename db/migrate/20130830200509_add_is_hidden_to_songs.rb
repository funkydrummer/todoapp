class AddIsHiddenToSongs < ActiveRecord::Migration
  def change
    add_column :songs, :is_hidden, :boolean, default: false
  end
end
