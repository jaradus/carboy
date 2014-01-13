class CreateHopsTable < ActiveRecord::Migration
  def change
    create_table :hops do |t|
      t.text      :name
      t.integer   :api_id
      t.text      :description
      t.text      :country_iso_code
      t.float     :alpha_acid_min
      t.float     :alpha_acid_max
      t.float     :beta_acid_min
      t.float     :beta_acid_max
      t.float     :humulene_min
      t.float     :humulene_max
      t.float     :caryophyllene_min
      t.float     :caryophyllene_max
      t.float     :cohumulone_min
      t.float     :cohumulone_max
      t.float     :myrcene_min
      t.float     :myrcene_max
      t.float     :farnesene_min
      t.float     :farnesene_max
      t.boolean   :is_noble
      t.boolean   :for_bittering
      t.boolean   :for_flavor
      t.boolean   :for_aroma

      t.timestamps
    end
  end
end
