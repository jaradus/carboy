class BatchesHop < ActiveRecord::Base

  attr_accessible :batch_id, :hop_id, :quantity, :unit_measure, :minutes_in_boil, :alpha_acid, :beta_acid, :hop_attributes

  belongs_to :batch
  belongs_to :hop

  accepts_nested_attributes_for :hop, :reject_if => lambda { |a| a[:content].blank? }

end