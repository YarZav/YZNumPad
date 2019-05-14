Pod::Spec.new do |s|

   s.platform = :ios
   s.ios.deployment_target = '11.0'
   s.name = "YZNumPad"
   s.summary = "YZNumPad this is simple number pad"
   s.requires_arc = true

   s.version = "1.0.1"

   s.author = { "Yaroslav Zavyalov" => "yaroslavzavyalov1@gmail.com" }

   s.homepage = "https://github.com/YarZav/YZNumPad"

   s.source = { :git => "https://github.com/YarZav/YZNumPad.git", :tag => "#{s.version}"}

   s.framework = "UIKit"

   s.source_files = "YZNumPad/**/*.{swift}"

   s.resources = "YZNumPad/**/*.{png,jpeg,jpg,storyboard,xib}"
   s.resource_bundles = {
      'YZNumPad' => ['YZNumPadt/**/*.xcassets']
   }
end
