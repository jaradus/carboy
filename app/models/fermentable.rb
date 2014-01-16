class Fermentable < ActiveRecord::Base

attr_accessible :api_id, :name, :description, :country_iso_code, :srm_id, :srm_precise, :moisture_content, :diastatic_power, :potential_yield, :dry_yield, :protein, :soluble_nitrogen_ratio, :max_in_batch, :requires_mashing, :category, :characteristics

has_many :batches_fermentables, :dependent => :destroy
has_many :batches, :through => :batches_fermentables


end