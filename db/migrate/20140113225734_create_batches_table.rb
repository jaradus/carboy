class CreateBatchesTable < ActiveRecord::Migration
  def change
    create_table :batches do |t|
      t.integer   :beer_id
      t.text      :name
      t.text      :description
      t.text      :notes
      t.text      :label_url
      t.integer   :rating
      t.integer   :original_gravity, default: 9999
      t.integer   :final_gravity, default: 9999
      t.date      :brew_date
      t.date      :secondary_date
      t.date      :bottling_date
      t.integer   :user_id

      t.timestamp  
    end
 
  end
end
