Pod::Spec.new do |s|

  s.name         = "DPLocalization"
  s.version      = "1.7"
  s.summary      = "Provides way to change localization inside application"
  s.homepage     = "https://github.com/nullic/DPLocalizationManager"
  s.license      = "MIT"
  s.author       = { "Dmitriy Petrusevich" => "nullic@gmail.com" }
  s.platforms    = { :ios => "5.0", :osx => "10.7" }
  
  s.source       = { :git => "https://github.com/nullic/DPLocalizationManager.git", :tag => "1.7" }
  s.source_files = "DPLocalization", "DPLocalization/*.{h,m}"
  s.requires_arc = true

  s.subspec 'Plural' do |ss|
    ss.source_files = "DPLocalization/Plural/*.{h,m,c}"
  end

  s.subspec 'Formatter' do |ss|
    ss.source_files = "DPLocalization/Formatter/*.{h,m}"
  end

  s.subspec 'Proxy' do |ss|
    ss.source_files = "DPLocalization/Proxy/*.{h,m}"
  end

  s.subspec 'Categories' do |ss|
    ss.source_files = "DPLocalization/Categories/*.{h,m}"
  end

end
