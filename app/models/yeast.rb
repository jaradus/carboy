class Yeast < ActiveRecord::Base

  attr_accessible :name, :api_id, :description, :yeast_type, :attenuation_min, :attenuation_max, :ferment_temp_min, :ferment_temp_max, :alcohol_tolerance_min, :alcohol_tolerance_max, :supplier, :product_id, :yeast_format, :category

  has_many :batches_yeasts, :dependent => :destroy
  has_many :batches, :through => :batches_yeasts

  def index

  end

end