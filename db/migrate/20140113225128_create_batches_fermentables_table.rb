class CreateBatchesFermentablesTable < ActiveRecord::Migration
  def change
    create_table :batches_fermentables do |t|
      t.belongs_to :batch
      t.belongs_to :fermentable
      t.integer    :quantity
      t.text       :unit_measure
      t.integer    :minutes_in_boil

      t.timestamps
    end
  end
end
