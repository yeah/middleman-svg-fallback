require "middleman-core"

require "middleman-svg-fallback/version"

::Middleman::Extensions.register(:svg_fallback) do
  require "middleman-svg-fallback/extension"
  ::Middleman::SVGFallback
end