require 'app_gate/version'
require 'app_gate/apps'
require 'app_gate/middleware'

require 'rack'

module AppGate
  class << self
    attr_accessor :app_id
  end
end
