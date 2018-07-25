class AddDescriptionToBookmarks < ActiveRecord::Migration[5.2]
  def change
    add_column :bookmarks, :description, :text
    add_column :bookmarks, :favicon, :string
    add_column :bookmarks, :image, :string
  end
end
