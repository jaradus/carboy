class Specialty < ActiveRecord::Base

  attr_accessible :name, :description, :classification

  has_many :batches_specialties, :dependent => :destroy
  has_many :batches, :through => :batches_specialties

end