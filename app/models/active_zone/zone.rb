class ActiveZone::Zone < ActiveRecord::Base
  self.primary_key = "name"
  self.cache_versioning = true
  has_many :resources, class_name: "Zone::Resource"
  enum resolvability: [:active, :disabled]
  after_commit :upsert_at_provider

  def upsert_at_provider(provider)
    provider.zones.find_or_create(self)
  end
end
