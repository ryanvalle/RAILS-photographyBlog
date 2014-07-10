class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|
      t.text :name
      t.text :url
      t.string :type
      t.string :parent
      t.integer :status

      t.timestamps
    end
  end
end
