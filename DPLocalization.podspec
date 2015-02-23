Pod::Spec.new do |s|

  s.name         = "DPLocalization"
  s.version      = "1.5"
  s.summary      = "Provides way to change localization inside application"
  s.homepage     = "https://github.com/nullic/DPLocalizationManager"
  s.license      = "MIT"
  s.author       = { "Dmitriy Petrusevich" => "nullic@gmail.com" }
  s.platforms    = { :ios => "7.0", :osx => "10.7" }
  
  s.source       = { :git => "https://github.com/nullic/DPLocalizationManager.git", :tag => "1.5" }
  s.source_files = "DPLocalization", "DPLocalization/*.{h,m}"
  s.requires_arc = true

end
