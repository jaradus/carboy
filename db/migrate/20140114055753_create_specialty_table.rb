class CreateSpecialtyTable < ActiveRecord::Migration
  def change
    create_table :specialty do |t|
      t.text    :name
      t.text    :description
      t.text    :type
    end
  end
end
