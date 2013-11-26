# AppGate

Rack based Application/Service validation library.

The authentication is based on shared identifiers using a custom HTTP header and application configuration.

HTTP requests received by a particular application/service should include a custom HTTP header `APP_GATE_APP_ID` whose value corresponds to the calling application's identifier. That identifier is stored (for now) in `lib/app_gate/apps`.

`lib/app_gate/apps` stores application/service identifiers
`lib/app_gate/middleware` validates that the custom

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

## Rails Integration

Add an initializer to `config/initializers` named `app_gate.rb`

    require 'app_gate'

    AppGate.app_id = 'identifier-for-this-application-stored-in-app-gate'

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
