class Middleman::SVGFallback < Middleman::Extension
  option :inkscape_bin, 'inkscape', 'Path to Inkscape binary, e.g. "/Applications/Inkscape.app/Contents/Resources/bin/inkscape" on a Mac, defaults to "inkscape"'
  option :inkscape_options, '', 'Command line arguments, that shall be passed on to inkscape, e.g. "--export-dpi=100 --export-background-opacity=0", defaults to ""'

  def after_build(builder)
    dir = File.join(app.config[:build_dir], app.config[:images_dir])

    run_args = { capture: true, verbose:  app.config.cli_options['verbose'] }

    Dir[File.join(dir, '**', '*.svg*')].each do |file|
      # make sure we have both an svg and an svgz version
      unprefixed = file.sub(/\.svgz?$/, '')
      basename = File.expand_path(unprefixed)

      unless File.exists? "#{basename}.svg"
        builder.thor.run("gunzip --to-stdout #{basename}.svgz > #{basename}.svg", run_args)
        builder.thor.say_status :svg, "#{unprefixed}.svg"
      end

      unless File.exists? "#{basename}.svgz"
        builder.thor.run("gzip --to-stdout #{basename}.svg > #{basename}.svgz", run_args)
        builder.thor.say_status :svgz, "#{unprefixed}.svgz"
      end

      # generate fallbacks
      %w(jpg png).each do |ext|
        builder.thor.run("#{options.inkscape_bin} --export-png=#{basename}.#{ext} #{options.inkscape_options} --without-gui #{basename}.svg", run_args)
        builder.thor.say_status :svg_fallback, "#{unprefixed}.#{ext}"
      end
    end
  end
end
