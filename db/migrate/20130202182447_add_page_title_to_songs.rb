class AddPageTitleToSongs < ActiveRecord::Migration
  def change
    add_column :songs, :page_title, :string
  end
end
