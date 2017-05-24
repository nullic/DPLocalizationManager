Pod::Spec.new do |s|

  s.name         = "DPLocalization"
  s.version      = "1.8.3"
  s.summary      = "Provides way to change localization inside application"
  s.homepage     = "https://github.com/nullic/DPLocalizationManager"
  s.license      = "MIT"
  s.author       = { "Dmitriy Petrusevich" => "nullic@gmail.com" }
  s.platforms    = { :ios => "5.0", :osx => "10.7" }
  
  s.source       = { :git => "https://github.com/nullic/DPLocalizationManager.git", :tag => "1.8.3" }
  s.source_files = "DPLocalization", "DPLocalization/*.{h,m}", "DPLocalization/Plural/*.{h,m,c}", "DPLocalization/Formatter/*.{h,m}", "DPLocalization/Proxy/*.{h,m}", "DPLocalization/Categories/*.{h,m}", "DPLocalization/Storage/*.{h,m}"
  s.requires_arc = true

end
