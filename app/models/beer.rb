class Beer < ActiveRecord::Base

  attr_accessible :name, :description, :regional_style_id, :beer_style, :color, :original_gravity, :time_to_make, :time_unit, :image_url, :recipe_link, :country_style

  has_many :batches
  has_one :beerstyle, :dependent => :destroy
  has_one :regionalstyle, :through => :beerstyle

  
end