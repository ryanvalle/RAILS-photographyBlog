class AddExifshowToArticle < ActiveRecord::Migration
  def change
  	add_column :articles, :exifshow, :boolean
  end
end
