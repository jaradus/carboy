class BatchesFermentable < ActiveRecord::Base

  attr_accessible :batch, :fermentable, :quantity, :unit_measure, :minutes_in_boil

  belongs_to :batch
  belongs_to :fermentable

end