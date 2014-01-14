class CreateRegionalStyleTable < ActiveRecord::Migration
  def change
    create_table :regional_styles do |t|
      t.text        :name
      t.text        :description
      t.integer     :api_id
      t.text        :beer_category
      t.float     :ibu_min
      t.float     :ibu_max
      t.float     :abv_min
      t.float     :abv_max
      t.float     :srm_min
      t.float     :srm_max
      t.integer     :og_min
      t.integer     :og_max
      t.integer     :fg_min
      t.integer     :fg_max

      t.timestamps
    end
  end
end