class Beer < ActiveRecord::Base

  attr_accessible :name, :description, :regional_style, :beer_style, :color, :original_gravity, :time_to_make, :time_unit, :image_url, :recipe_link, :country_style, :regional_style_attribute

  has_many :batches
  has_one :beers_regionalstyle, :dependent => :destroy
  has_one :regional_style, :through => :beers_regionalstyle
  
  accepts_nested_attributes_for :regional_style

end