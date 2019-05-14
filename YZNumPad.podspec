Pod::Spec.new do |s|

  s.platform = :ios
  s.ios.deployment_target = '11.0'

  s.name         = "YZNumPad"
  s.version      = "0.0.1"
  s.summary      = "This is a simple number pad"
  s.requires_arc = true

  s.description  = "This is a simple number pad with decimal point and delete button like a password screen in iPhone or iPad"

  s.homepage     = "https://github.com/YarZav/YZNumPad"
  s.license      = "MIT"
  s.author             = { "Yaroslav" => "yaroslavzavyalov1@gmail.com" }
  s.platform     = :ios, "11.0"
  s.source       = { :git => "https://github.com/YarZav/YZNumPad.git", :tag => "#{s.version}" }

  s.source_files  = "Classes", "Classes/**/*.{h,m}"

  s.swift_version = "4.2"

end
