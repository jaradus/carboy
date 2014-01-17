class CreateBatchesFermentablesTable < ActiveRecord::Migration
  def change
    create_table :batches_fermentables do |t|
      t.integer    :batch_id
      t.integer    :fermentable_id
      t.integer    :quantity
      t.text       :unit_measure
      t.integer    :minutes_in_boil

      t.timestamps
    end

    add_index :batches_fermentables, [:batch_id, :fermentable_id]
  end
end
