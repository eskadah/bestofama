class Metum < ActiveRecord::Base
  attr_accessible :name, :value
  validates_presence_of :name, :value
  validates_uniqueness_of :name
  validates_format_of :name, :with => /[-a-z0-9-_]/
end