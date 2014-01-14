class CreateReviewsTable < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.text        :title
      t.date        :review_date
      t.text        :review
      t.text        :image_url
      t.belongs_to  :batch
    end

  end
end
