module ActiveZone
  class Provider::ZoneCollectionProxy
    include Enumerable
    attr_reader :provider
    self.abstract_class = true

    def initialize(provider)
      @provider = provider
    end

    # This method should iterate over the zones on the provider
    def each(&block)
      raise NotImplementedError
    end

    # Add database Zone to provider
    # @param Zone
    def <<(zone)
      raise NotImplementedError
    end

    # Create new zone at a provider
    # @return ActiveZone::Provider::ZoneProxy
    def create(attributes = {}, &block)
      raise NotImplementedError
    end

    # Destroy all zones at a provider
    def destroy_all
      raise NotImplementedError
    end

    # Find a zone by attribute at a provider
    # @return ActiveZone::Provider::ZoneProxy
    def find_by
      raise NotImplementedError
    end

    # Find a zone by name at a provider, if not found then create it
    # @return ActiveZone::Provider::ZoneProxy
    def find_or_create_by(attributes = {}, &block)
      raise NotImplementedError
    end

    # From a database zone, update a zone by name at a provider, if not found then create it
    # @param Zone
    # @return ActiveZone::Provider::ZoneProxy
    def upsert_by_name(zone)
      raise NotImplementedError
    end
  end
end
