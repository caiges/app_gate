module AppGate
  module Apps
    @ids = {
      client_site: 'uab98cQsZ9G2f9tAEC-bhA' 
    }

    def valid?(id)
      @ids.has_value(id)
    end
  end
end
