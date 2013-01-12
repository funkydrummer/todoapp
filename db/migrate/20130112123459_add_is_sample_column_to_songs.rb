class AddIsSampleColumnToSongs < ActiveRecord::Migration
  def change
    add_column :songs, :is_sample, :boolean, :null => false, :default => false
  end
end
