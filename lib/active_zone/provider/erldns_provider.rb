require "httparty"

module ActiveZone
  class Provider::ErldnsProvider < Provider
    include HTTParty
    base_uri "https://wzsr6.underpass.clb.li"

    def zones
      Provider::ErldnsProvider::ZoneCollectionProxy.new(self)
    end
  end

  class Provider::ErldnsProvider::ZoneCollectionProxy < Provider::ZoneCollectionProxy
    def each
      req = Provider::ErldnsProvider.get("/", {basic_auth: {username: "oval", password: "dnsupdate"}, headers: {Accept: "application/json"}, format: :json})
      req["erldns"]["zones"]["versions"].map { |z|
        zp = ActiveZone::Provider::ZoneProxy.new
        zp.name = z["name"]
        zp
      }.each do |zp|
        yield zp
      end
    end
  end
end
