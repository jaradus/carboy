class BatchesFermentable < ActiveRecord::Base

  attr_accessible :batch_id, :fermentable_id, :quantity, :unit_measure, :minutes_in_boil

  belongs_to :batch
  belongs_to :fermentable

end