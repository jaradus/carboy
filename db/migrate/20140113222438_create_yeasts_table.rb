class CreateYeastsTable < ActiveRecord::Migration
  def change
    create_table :yeasts do |t|
      t.text      :name
      t.integer   :api_id
      t.text      :description
      t.text      :yeast_type
      t.integer   :attenuation_min
      t.integer   :attenuation_max
      t.integer   :ferment_temp_min
      t.integer   :ferment_temp_max
      t.integer   :alcohol_tolerance_min
      t.integer   :alcohol_tolerance_max
      t.text      :supplier
      t.text      :product_id
      t.text      :yeast_format
      t.text      :category

      t.timestamps
    end
  end
end
