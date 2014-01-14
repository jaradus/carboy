class CreateRegionalstylesBeersTable < ActiveRecord::Migration
  def change
    create_table :regionalstyles_beers do |t|
      t.belongs_to :beer
      t.belongs_to :regional_style

      t.timestamps
    end

  end
end
