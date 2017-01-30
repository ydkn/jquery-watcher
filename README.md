[![Gem Version](https://img.shields.io/gem/v/jquery-watcher.svg)](https://rubygems.org/gems/jquery-watcher)
[![Dependencies](https://img.shields.io/gemnasium/ydkn/jquery-watcher.svg)](https://gemnasium.com/ydkn/jquery-watcher)
[![Code Climate](https://img.shields.io/codeclimate/github/ydkn/jquery-watcher.svg)](https://codeclimate.com/github/ydkn/jquery-watcher)


# Jquery::Watcher

Allow to to register callbacks on elements regardless if they are loaded with _document.ready_, _turbolinks:load_ or DOM manipulation (e.g. through Ajax)

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'jquery-watcher'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install jquery-watcher

Finally add it to your _application.js_:

    //= require jquery-watcher

## Usage

```coffeescript
$.watch 'a.fancy', (element) ->
  element.click ->
    alert('Awesome')
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/ydkn/jquery-watcher. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
