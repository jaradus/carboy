class CreateBatchesSpecialtiesTable < ActiveRecord::Migration
  def change
    create_table :batches_specialties do |t|
      t.belongs_to :batch
      t.belongs_to :specialty
      t.integer    :quantity
      t.text       :unit_measure
      t.integer    :minutes_in_kettle
      t.text       :type

      t.timestamps
    end
  end
end
