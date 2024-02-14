class ActiveZone::Zone < ActiveRecord::Base
  self.primary_key = "name"
  self.cache_versioning = true
  has_many :resources, class_name: "Zone::Resource"
  enum resolvability: [:active, :disabled]
end
