class CreateBatchesYeastsTable < ActiveRecord::Migration
  def change
    create_table :batches_yeasts do |t|
      t.integer    :batch_id
      t.integer    :yeast_id
      t.integer    :quantity
      t.text       :unit_measure
      t.boolean    :starter

      t.timestamps
    end

    add_index :batches_yeasts, [:batch_id, :yeast_id]
  end
end