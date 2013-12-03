# AlterFormImages

More perfect decision for loading image in form with preview. This gem using several simple things that are bundled in small flexible plugin for Rails.

## Installation

Add this line to your application's Gemfile:

    gem 'alter_form_images'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install alter_form_images

## Usage

For start using provided tweaks add require js in your application.js:

```javascript
  //= require alter_form_images
```

Then add require css in your application.css:

```stylesheet
  *= require alter_form_images
```

And now we need to do the last step with example situation: you has _User_ model with _avatar_ attachment and for setting it in form add follow lines of code:

```ruby
  f.image_fields_for :avatar
```

You of course may do some configuration in this point:

```ruby
  f.image_fields_for :avatar, {
    width: 100,                          # Width of preview image
    height: 100,                         # Height of preview image
    default_image: 'default_image.png',  # Url to default image
    preview_style: :original             # Style of image for preview in edit form
  }
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
