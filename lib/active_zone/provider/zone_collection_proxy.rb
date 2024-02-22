module ActiveZone
  class Provider::ZoneCollectionProxy
    include Enumerable
    attr_reader :provider

    def initialize(provider)
      @provider = provider
    end

    # Iterate over the zones at the provider#
    # @return [ActiveZone::Provider::ZoneProxy]
    def each(&block)
      raise NotImplementedError
    end

    # Create new zone at a provider
    # @param attributes [Object] the attributes of the zone to find by or create with
    # @return [ActiveZone::Provider::ZoneProxy]
    def create(attributes = {})
      raise NotImplementedError
    end

    # Destroy all zones at a provider
    # @return [ActiveZone::Provider::ZoneCollectionProxy]
    def destroy_all
      raise NotImplementedError
    end

    # Find a zone by attribute at a provider
    # @return [ActiveZone::Provider::ZoneProxy]
    def find_by(attributes = {})
      raise NotImplementedError
    end

    # Find a zone by name at a provider, if not found then create it
    # @param attributes [Object] the attributes of the zone to find by or create with
    # @return [ActiveZone::Provider::ZoneProxy]
    def find_or_create_by(attributes = {})
      find_by(attributes) || create(attributes)
    end

    # From a database zone, update a zone by name at a provider, if not found then create it
    # @param zone [ActiveZone::Zone]
    # @return [ActiveZone::Provider::ZoneProxy]
    def upsert_by_name(zone)
      z = find_or_create_by(name: zone.name)
      z.update(zone)
    end
  end
end
