module AppGate
  ##
  # Storage and validation mechanism used for authenticating applications.
  #
  module Apps

    @ids = {
      client_site: 'uab98cQsZ9G2f9tAEC-bhA' 
    }

    # @return [Hash] a collection of applications and their identifiers.
    def self.ids
      @ids
    end

    # Validates the application ID is in the list of valid IDs.
    #
    # @param id The ID to validate.
    def self.valid?(id)
      self.ids.has_value?(id)
    end
  end
end
