module ActiveZone
  class Provider
    # Get the zones for a given provider
    #
    # @return ActiveZone::Provider::ZoneCollectionProxy
    def zones
      ActiveZone::Provider::ZoneCollectionProxy.new(self)
    end
  end
end
