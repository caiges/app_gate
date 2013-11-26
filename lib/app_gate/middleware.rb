module AppGate
  class Middleware
    def initialize(app)
      @app = app
    end

    def call(env)
      # 'HTTP_' is prefixed to all HTTP headers in the Rack spec.
      AppGate::Apps.valid?(env['HTTP_APP_GATE_APP_ID']) ? @app.call(env) : not_authorized()
    end

    protected

    def not_authorized
      ['401', { 'Content-Type' => 'text/plain; charset=utf-8' }, ['401 Not Authorized']]
    end
  end
end
