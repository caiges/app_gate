# AppGate

Rack based Application/Service validation library.

The authentication is based on shared identifiers using a custom HTTP header and application configuration.

This relationship is defined by a receiver and a caller.

HTTP requests received by a particular application/service (receiver) validate a custom HTTP header `APP_GATE_APP_ID` included in the HTTP request by another application (caller). The value of that header corresponds to the calling application's identifier (caller). That identifier is stored (for now) in `lib/app_gate/apps`.

`lib/app_gate/apps` stores application/service identifiers
`lib/app_gate/middleware` validates the custom HTTP header (APP_GATE_APP_ID)

## Installation

Clone the a copy of the repository to somewhere handy.

For example, if you clone the repo to a shared projects directory:

    |-- app_gate
    |-- your-rails-app
        |-- ...
        |-- Gemfile
        |-- ...

Add this line to your application's Gemfile:

    gem 'app_gate', :path: File.join('..', 'app_gate')

And then execute:

    $ bundle

## Calling Application

Whenever a request is made to a receiving application/service (receiver) the application/service identifier must be included in the `APP_GATE_APP_ID` HTTP header.

### Rails Integration

Add an initializer to `config/initializers` named `app_gate.rb`

    require 'app_gate'

    AppGate.app_id = 'identifier-for-this-application-stored-in-app-gate'

The `app_id` could be stored elsewhere in the application configuration but since this API is loosely defined and the "ID registration and storage" implementation could change significantly in the future we're setting it here.

### Sinatra Integration

Within your Sinatra application, set the `app_id`

    require 'app_gate'
    
    AppGate.app_id = 'identifier-for-this-application-stored-in-app-gate'
    
    ...
    
    get '/' do
        puts 'Blars Tacoman!'
    end
    
    ...
    
## Receiving Application/Service

This will allow AppGate to validate that the incoming request contains a valid application/service identifier and shortcuts further application processing.

### Rails Integration

Within `config/application.rb` or `config/environments/**.rb` instruct Rails to use the AppGate middleware.

   config.middleware.before ActionDispatch::Session::CookieStore, AppGate::Middleware 

### Sinatra Integration

Within your Sinatra application, include the AppGate middleware:

    use AppGate::Middleware

## Application/Service Identifiers

Application/Service IDs are generated using Ruby's (SecureRandom)[http://www.ruby-doc.org/stdlib-1.9.3/libdoc/securerandom/rdoc/SecureRandom.html] library. A random URL-safe base 64 string is used as the ID.

    SecureRandom.urlsafe_base64()

For now, these are hard-coded within `lib/app_gate/apps.rb`.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
