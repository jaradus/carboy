class CreateBeerstyleTable < ActiveRecord::Migration
  def change
    create_table :beerstyles do |t|
      t.integer :beer_id
      t.integer :regionalstyle_id

      t.timestamps
    end

    add_index :beerstyles, [:beer_id, :regionalstyle_id]
  end
end