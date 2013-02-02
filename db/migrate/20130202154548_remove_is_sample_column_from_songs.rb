class RemoveIsSampleColumnFromSongs < ActiveRecord::Migration
  def change
    remove_column :songs, :is_sample 
  end
end
