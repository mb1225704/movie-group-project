class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.string :score, null: false
      t.string :title, null: false
      t.text :body
      t.belongs_to :user, null: false
      t.belongs_to :movie, null: false
      t.timestamps
    end
  end
end
