class Specialty < ActiveRecord::Main

  has_many :batches_specialties, :dependent => :destroy
  has_many :batches, :through => :batches_specialties

end