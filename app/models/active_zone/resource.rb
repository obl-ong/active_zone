class ActiveZone::Resource < ActiveRecord::Base
  self.table_name = "active_zone_resources"
  belongs_to :domains

  self.abstract_class = true

  def self.types
    subclasses.map { |r| r.name.demodulize }
  end
end
