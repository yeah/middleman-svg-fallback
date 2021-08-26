require 'middleman-core'

Middleman::Extensions.register(:svg_fallback) do
  require 'middleman/svg_fallback'
  Middleman::SVGFallback
end
