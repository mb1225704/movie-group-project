class CreateMovies < ActiveRecord::Migration[5.2]
  def change
    create_table :movies do |t|
      t.string :title, null: false
      t.string :genre, null: false
      t.string :release_date, null: false
      t.string :poster_image_url, null: false
      t.integer :score, null: false
      t.string :rating, null: false
      t.string :language
      t.string :runtime, null: false
      t.text :description
      t.timestamps
    end
  end
end
