class AddKindToSong < ActiveRecord::Migration
  def change
    add_column :songs, :kind, :string
  end
end
