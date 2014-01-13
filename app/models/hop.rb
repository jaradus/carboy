class Hop < ActiveRecord::Base

attr_accessible :name, :api_id, :description, :country_iso_code, :alpha_acid_min, :alpha_acid_max, :beta_acid_min, :beta_acid_max, :humulene_min, :humulene_max, :caryophyllene_min, :caryophyllene_max, :cohumulone_min, :cohumulone_max, :myrcene_min, :myrcene_max, :farnesene_min, :farnesene_max, :is_noble, :for_bittering, :for_flavor, :for_aroma

  def self.update_database

  end

end