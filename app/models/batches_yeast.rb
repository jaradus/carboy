class BatchesYeast < ActiveRecord::Base

  attr_accessible :batch_id, :yeast_id, :quantity, :unit_measure, :starter

  belongs_to :batch
  belongs_to :yeast

end