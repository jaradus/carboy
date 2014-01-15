class Beerstyle < ActiveRecord::Base
  
  attr_accessible :beer_id, :regionalstyle_id

  belongs_to :beer
  belongs_to :regionalstyle


end
