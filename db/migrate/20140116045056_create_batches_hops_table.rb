class CreateBatchesHopsTable < ActiveRecord::Migration
  def change
    create_table :batches_hops do |t|
      t.integer    :batch_id
      t.integer    :hop_id
      t.float    :quantity
      t.text       :unit_measure
      t.integer    :minutes_in_boil
      t.float      :alpha_acid
      t.float      :beta_acid

      t.timestamps
    end

    add_index :batches_hops, [:batch_id, :hop_id]
  end
end