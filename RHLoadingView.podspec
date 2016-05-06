Pod::Spec.new do |s|

  s.name         = "RHLoadingView"
  s.version      = "1.0.1"
  s.summary      = "RHLoadingView: Some IndicatorView."
  s.homepage     = "https://github.com/zhu410289616/RHLoadingView"
  s.license      = { :type => "Apache", :file => "LICENSE" }
  s.author       = { "zhu410289616" => "zhu410289616@163.com" }

  s.ios.deployment_target = "6.0"
  
  s.source       = { :git => "https://github.com/zhu410289616/RHLoadingView.git", :tag => s.version.to_s }

  s.default_subspec = "Indicator", "Loading"

  s.subspec "Loading" do |cs|
    cs.dependency "RHLoadingView/Indicator"
    cs.dependency 'Masonry', '~> 0.6.1'
    cs.source_files = "RHLoadingView/*.{h,m}"
    cs.requires_arc = true 
  end

  s.subspec "Indicator" do |cs|
    cs.source_files = "JQIndicatorView/*.{h,m}"
    cs.requires_arc = true 
  end

end
