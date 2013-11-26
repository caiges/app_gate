require 'app_gate/version'
require 'app_gate/apps'
require 'app_gate/middleware'

require 'rack'

##
# Rack middleware for authenticating applications.
#
module AppGate
  # @!attribute [r] app_id
  #   @return [String] the identifier for the current application.
  def self.app_id
    @app_id
  end
  def self.app_id=(app_id)
    @app_id = app_id
  end
end
