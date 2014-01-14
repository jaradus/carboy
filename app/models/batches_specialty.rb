class BatchesSpecialty < ActiveRecord::Base

  attr_accessible :batch_id, :specialty_id, :quantity, :unit_measure, :minutes_in_kettle, :purpose

  belongs_to :batch
  belongs_to :specialty

end