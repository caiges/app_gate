module AppGate
  class Middleware
    def initialize(app)
      @app = app
    end

    def call(env)
      puts env
      puts AppGate.app_id
      @app.call(env)
    end
  end
end
