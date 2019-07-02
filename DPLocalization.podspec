Pod::Spec.new do |s|

  s.name         = "DPLocalization"
  s.version      = "1.13"
  s.summary      = "Provides way to change localization inside application"
  s.homepage     = "https://github.com/nullic/DPLocalizationManager"
  s.license      = "MIT"
  s.author       = { "Dmitriy Petrusevich" => "nullic@gmail.com" }
  s.platforms    = { :ios => "8.0", :osx => "10.11" }
  
  s.source       = { :git => "https://github.com/nullic/DPLocalizationManager.git", :tag => "1.13" }
  s.source_files = "DPLocalization", "DPLocalization/*.{h,m,c}", "DPLocalization/include/*.h"
  s.requires_arc = true

end
