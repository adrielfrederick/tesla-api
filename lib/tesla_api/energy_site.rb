module TeslaApi
  class EnergySite
    attr_reader :client, :api, :email, :site_id, :energy_site

    def initialize(client, email, site_id, energy_site)
      @client = client
      @email = email
      @site_id = site_id
      @energy_site = energy_site
    end

    # Properties

    def [](key)
      energy_site[key]
    end

    def method_missing(name)
      if energy_site.key?(name.to_s)
        energy_site[name.to_s]
      else
        raise NoMethodError.new("Energy Site does not have property `#{name}`", name)
      end
    end

    def respond_to_missing?(name, include_private = false)
      energy_site.key?(name.to_s) || super
    end


    # State
    def site_status
      client.get("/energy_sites/#{id}/site_status")["response"]
    end


    # History

  end
end
