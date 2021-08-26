Feature: Create fallbacks for SVG images

  Scenario: No changes if svg-fallback is not activated
    Given a fixture app "image-app"
    And a file named "config.rb" with:
      """
      """
    And a successfully built app at "image-app"
    Then the file "build/images/sample.svg" should exist
    And the file "build/images/sample.png" should not exist
    And the file "build/images/sample.jpg" should not exist
    And the file "build/images/sample.svgz" should not exist

    And the file "build/images/sample2.svgz" should exist
    And the file "build/images/sample2.png" should not exist
    And the file "build/images/sample2.jpg" should not exist
    And the file "build/images/sample2.svg" should not exist


  Scenario: Creates svgz, jpg, and png if svg-fallback is activated
    Given a fixture app "image-app"
    And a file named "config.rb" with:
      """
        activate :svg_fallback, inkscape_bin: ENV['INKSCAPE_BIN'] || 'inkscape'
      """
    And a successfully built app at "image-app"

    Then the file "build/images/sample.svg" should exist
    And the file "build/images/sample.png" should exist
    And the file "build/images/sample.jpg" should exist
    And the file "build/images/sample.svgz" should exist

    And the file "build/images/sample2.svgz" should exist
    And the file "build/images/sample2.png" should exist
    And the file "build/images/sample2.jpg" should exist
    And the file "build/images/sample2.svg" should exist
