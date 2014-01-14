class CreateBatchesSpecialtiesTable < ActiveRecord::Migration
  def change
    create_table :batches_specialties do |t|
      t.integer    :batch_id
      t.integer    :specialty_id
      t.integer    :quantity
      t.text       :unit_measure
      t.integer    :minutes_in_kettle
      t.text       :purpose

      t.timestamps
    end
  end
end
