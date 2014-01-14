class CreateBatchesYeastsTable < ActiveRecord::Migration
  def change
    create_table :batches_yeasts do |t|
      t.belongs_to :batch
      t.belongs_to :yeast
      t.integer    :quantity
      t.text       :unit_measure
      t.boolean    :starter

      t.timestamps
    end
  end
end