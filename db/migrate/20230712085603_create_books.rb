class CreateBooks < ActiveRecord::Migration[7.0]
  def change
    create_table :books do |t|
      t.references :user, null: false, foreign_key: true
      t.string :title
      t.float :price
      t.text :body
      t.string :genre
      t.string :isbn
      t.string :author

      t.timestamps
    end
  end
end
