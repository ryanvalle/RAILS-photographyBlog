class CreateGalleries < ActiveRecord::Migration
  def change
    create_table :galleries do |t|
      t.text :name

      t.timestamps
    end
  end
end
