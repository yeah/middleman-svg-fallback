# middleman-svg-fallback

Generate nice JPEG and PNG files from any SVG files in your `images/` folder.

Also, generate gzipped SVGZ files.

*Attention:* This requires [Inkscape](http://inkscape.org/).

## Installation

Add this line to your `Gemfile`:

```ruby
gem 'middleman-svg-fallback'
```


## Configuration

Activate the plugin in your config.rb:

```ruby
activate :svg_fallback
```

You may provide the path to your inkscape binary, if it's not in the `PATH`.
E.g. on macOS, you may use the following configuration:

```ruby
activate :svg_fallback, inkscape_bin: '/Applications/Inkscape.app/Contents/Resources/bin/inkscape'
```

Furthermore, you may configure command line arguments, that should be passed on
to inkscape:

```ruby
activate :svg_fallback, inkscape_options: '--export-dpi=100 --export-background-opacity=0'
```


## Usage

If configured properly, middleman-svg-fallback will generate fallback images
(PNGs and JPGs) for all SVGs within your `images_dir` as you would expect. You
can use them with a [modernizr](http://modernizr.com/) based CSS rule, like this
for example:

```css
.illustration {
  background: url('illustration.svg') 0 0 no-repeat;
}

.no-svg .illustration {
    background: url('illustration.png') 0 0 no-repeat;
}
```

The generated JPEG files are intended for use with [OpenGraph](http://ogp.me/).
Facebook doesn't like PNGs in `og:image` properties, so the JPG versions will
come in handy.


## License

This software is licensed under the MIT License. [View the license](LICENSE).


## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request


## Running the tests

To run the tests follow these steps:

1. Clone the repository
2. Run `bundle install` to install all development dependencies
3. Use `rake` to execute the test suite
   a. If inkscape is not in your PATH, you may provide the optional
      `INKSCAPE_PATH` environment variable, e.g.
      `INKSCAPE_PATH=/path/to/inkscape rake`
