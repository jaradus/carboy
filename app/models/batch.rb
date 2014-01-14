class Batch < ActiveRecord::Base

  attr_accessible :beer_id, :name, :description, :notes, :label_url, :rating, :original_gravity, :final_gravity, :brew_date, :secondary_date, :bottling_date, :fermentables_attributes, :hops_attributes, :yeasts_attributes, :specialties_attributes

  # Fermentables
  has_many :batches_fermentables, :dependent => :destroy
  has_many :fermentables, :through => :batches_fermentables

  # Hops
  has_many :batches_hops, :dependent => :destroy
  has_many :hops, :through => :batches_hops

  # Yeasts
  has_many :batches_yeasts, :dependent => :destroy
  has_many :yeasts, :through => :batches_yeasts

  # Specialties
  has_many :batches_specialties, :dependent => :destroy
  has_many :specialties, :through => :batches_specialties

  # Reviews
  has_many :reviews

  belongs_to :beer
  belongs_to :user

  accepts_nested_attributes_for :fermentables, :hops, :yeasts, :specialties

end