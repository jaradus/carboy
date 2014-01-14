class CreateBeersRegionalStyleTable < ActiveRecord::Migration
  def change
    create_table :beers_regional_styles do |t|
      t.integer :beer_id
      t.integer :regional_style_id

      t.timestamps
    end
  end
end