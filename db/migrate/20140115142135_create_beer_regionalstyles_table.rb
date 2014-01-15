class CreateBeerRegionalstylesTable < ActiveRecord::Migration
  def change
    create_table :beers_regionalstyle do |t|
      t.integer :beer_id
      t.integer :regional_style_id

      t.timestamps
    end
  end
end