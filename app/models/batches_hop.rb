class BatchesHop < ActiveRecord::Base

  attr_accessible :batch_id, :hop_id, :quantity, :unit_measure, :minutes_in_boil, :alpha_acid, :beta_acid

  belongs_to :batch
  belongs_to :hop

end