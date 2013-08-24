class AddColorToSongs < ActiveRecord::Migration
  def change
    add_column :songs, :color_class, :string
  end
end
