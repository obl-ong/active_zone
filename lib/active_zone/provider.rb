module ActiveZone
  class Provider
    self.abstract_class = true

    ##
    # Appends resources to a zone
    # @param zone [Zone]
    # @param resources [ActiveRecord::Relation|Array[]]
    def resources.add(zone, resources)
      raise NotImplementedError
    end
  end
end
