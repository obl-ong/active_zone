module ActiveZone
  class Provider::DiskProvider < Provider
    attr_accessor :path

    def initialize(path:, **options)
      @path = path
    end
  end
end
