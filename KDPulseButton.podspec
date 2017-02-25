Pod::Spec.new do |s|
  s.name         = "KDPulseButton"
  s.version      = "1.0.0"
  s.summary      = "A custom button that pulses."
  s.description  = "A simple button for customize your UI and to give a better use experience for your app."
  s.homepage     = "https://twitter.com/KaiqueDamato"
  s.license      = "MIT"
  s.author       = { 'Kaique Pantosi Damato' => 'kaiquedamato@icloud.com' }
  s.social_media_url   = "https://twitter.com/KaiqueDamato"
  s.platform     = :ios, "8.0"
  s.source       = { :git => "https://github.com/KaiqueDamato/KDPulseButton.git", :tag => "1.0.0" }
  s.source_files  = "KDPulseButton", "KDPulseButton/**/*.{h,m}"
  s.pod_target_xcconfig = { 'SWIFT_VERSION' => '3' }
end
