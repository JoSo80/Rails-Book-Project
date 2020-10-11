class CreateBooks < ActiveRecord::Migration[6.0]
  def change
    create_table :books do |t|
      t.string :title
      t.string :author
      t.integer :publication_year
      t.integer :number_of_pages
      t.decimal :average_rating
      t.references :publisher, null: false, foreign_key: true

      t.timestamps
    end
  end
end
