class CreateReviewsTable < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.text        :title
      t.date        :review_date
      t.text        :review
      t.integer     :rating
      t.text        :image_url
      t.integer     :batch_id

      t.timestamps
    end

    add_index :reviews, [:batch_id, :id]
  end
end
