module AppGate
  class Middleware
    def initialize(app)
      @app = app
    end

    def call(env)
      AppGate::Apps.valid?(AppGate.app_id) ? @app.call(env) : not_authorized()
    end

    protected

    def not_authorized
      ['401', { 'Content-Type' => 'text/plain; charset=utf-8' }, ['401 Not Authorized']]
    end
  end
end
