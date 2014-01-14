class CreateSpecialtiesTable < ActiveRecord::Migration
  def change
    create_table :specialties do |t|
      t.text    :name
      t.text    :description
      t.text    :type

      t.timestamps
    end
  end
end