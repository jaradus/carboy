class Beer < ActiveRecord::Base

  attr_accessible :name, :description, :regional_style_id, :beer_style, :color, :original_gravity, :time_to_make, :image_url

  has_many :batches
  has_many :regionalstyles_beers, :dependent => :destroy
  has_one :regional_style, :through => :regionalstyles_beers
  
end