class CreateBeersTable < ActiveRecord::Migration
  def change
    create_table :beers do |t|
      t.text        :name
      t.text        :description
      t.integer     :regional_style_id
      t.text        :beer_style
      t.text        :color
      t.integer     :original_gravity, default: 9999
      t.integer     :time_to_make
      t.text        :image_url

      t.timestamps
    end
  end
end
