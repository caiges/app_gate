# AppGate

TODO: Write a gem description

## Installation

Add this line to your application's Gemfile:

    gem 'app_gate'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install app_gate

## Usage

Application/Service IDs are generated using Ruby's (SecureRandom)[http://www.ruby-doc.org/stdlib-1.9.3/libdoc/securerandom/rdoc/SecureRandom.html] library. A random URL-safe base 64 string is used as the ID.

    SecureRandom.urlsafe_base64()

For now, these are hard-coded within `lib/app_gate/apps.rb`.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
