class Regionalstyle < ActiveRecord::Base

  attr_accessible :name, :description, :api_id, :beer_category, :ibu_min, :ibu_max, :abv_min, :abv_max, :srm_min, :srm_max, :og_min, :og_max, :fg_min, :fg_max

  has_many :beerstyles, :dependent => :destroy
  has_many :beers, :through => :beerstyles

end