class Beer < ActiveRecord::Base

  attr_accessible :name, :description, :regionalstyle, :beer_style, :color, :original_gravity, :time_to_make, :time_unit, :image_url, :recipe_link, :country_style, :regional_style_attribute

  has_many :batches
  has_one :beerstyle, :dependent => :destroy
  has_one :regionalstyle, :through => :beerstyle
  
  accepts_nested_attributes_for :regionalstyle

end