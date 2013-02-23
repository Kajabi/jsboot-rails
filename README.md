# Jsboot::Rails

A small solution for removing all inline javascript from your views.

This gem provides a small `jsboot` javascript file for use in the asset
pipeline.

The basic principal is that rather than bootstrapping json with inline
script tags, you use script tags of type `application/json` and include
a json data structure inside the tag.  The id for the tag is used to
lookup a callback function to find the js to bootstrap for the page
uniquely.

By not using inline javascript in your views, the gain is twofold:

* You no longer clutter your html with script tags
* More importantly, you can implement [Content Security Policy](http://en.wikipedia.org/wiki/Content_Security_Policy)
  to deny inline script tags, drastically narrowing the chance for XSS attacks
  against the site.

## Installation

Add this line to your application's Gemfile:

    gem 'jsboot-rails'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install jsboot-rails

## Usage

An example inclusion in your application.js file:

```javascript
//= require jsboot

window.MyApp = {};
Jsboot(window.MyApp, jQuery);

MyApp.jsboot.on("posts#show", function(data) {
  console.log(data);
});
```

and in your view

```ruby
# The data followed by a key, posts-show, used to build an id
# If no key is provided it will default to controller#action
<%= jsboot_data_tag({:foo => "bar"}, "posts#show") %>
```

The `jsboot_data_tag` is a helper provided that will convert objects
to json.  Passed data must respond to `#to_json`

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
