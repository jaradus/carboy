class CreateFermentablesTable < ActiveRecord::Migration
  def change
    create_table  :fermentables do |t|
      t.integer   :api_id
      t.text      :name
      t.text      :description
      t.text      :country_iso_code
      t.integer   :moisture_content
      t.integer   :diastatic_power
      t.float     :dry_yield
      t.float     :potential_yield
      t.integer   :protein
      t.integer   :soluble_nitrogen_ratio
      t.integer   :max_in_batch
      t.boolean   :requires_mashing
      t.text      :category
      t.text      :characteristics
      t.integer   :srm_id
      t.integer   :srm_precise

      t.timestamps
    end
  end
end
