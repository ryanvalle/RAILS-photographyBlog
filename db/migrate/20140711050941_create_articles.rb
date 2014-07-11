class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.text :title
      t.string :address
      t.text :body
      t.integer :user_id
      t.integer :status

      t.timestamps
    end
  end
end
