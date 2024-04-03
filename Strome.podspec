#
# Be sure to run `pod lib lint Strome.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'Strome'
  s.version          = '0.0.1'
  s.summary          = 'Swift framework for rapid development, offering seamless integration and enhanced functionality'
  s.swift_versions = '4.0'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
Strome is a dynamic Swift framework meticulously crafted to empower developers in their quest for efficient and rapid application development. Seamlessly integrating with native Swift frameworks like CoreData, UIKit, and Foundation, Strome equips developers with a suite of invaluable utilities and functions.

Developed with a focus on boosting productivity and reducing development time, Strome enables developers to unleash their creativity and build exceptional applications for iOS, macOS, watchOS, and tvOS platforms. With Strome at your disposal, common development tasks become streamlined, allowing you to focus on crafting unique user experiences and innovative features.

From simplifying data management to enhancing user interface design, Strome offers a comprehensive toolkit designed to accelerate development cycles and maximize efficiency. Whether you're a seasoned developer or just starting your journey, Strome empowers you to write cleaner, more maintainable code with ease.

Experience the power of Strome and elevate your Swift development projects to new heights of excellence.
                       DESC

  s.homepage         = 'https://github.com/nanhemaurya/Strome'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Ravi Prakash Maurya' => 'info.nanhemaurya@gmail.com' }
  s.source           = { :git => 'https://github.com/nanhemaurya/Strome.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '12.0'

  s.source_files = 'Strome/Classes/**/*'
  
  # s.resource_bundles = {
  #   'Strome' => ['Strome/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
    s.frameworks = 'UIKit', 'Foundation', 'CoreData'
  # s.dependency 'AFNetworking', '~> 2.3'
end
