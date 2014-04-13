Pod::Spec.new do |s|
  s.name                    = "Spritz-SDK"
  s.version                 = "0.8"
  s.summary                 = "iOS library for Spritz"
  s.homepage                = "http://spritzinc.com"
  s.author                  = { "Spritz Technology Inc." => "info@spritzinc.com" }
  s.platform                = :ios,'7.0'
  s.source                  = { :http => "https://sdk.spritzinc.com/ios/0.8/dist/Spritz-SDK-lahacks.zip" }
  
  s.vendored_frameworks     = 'Spritz-SDK.framework'
  s.resource				= 'Spritz-SDK.bundle'
  s.ios.deployment_target   = '7.0'

  s.frameworks              = 'Foundation', 'UIKit', 'CoreText'
  s.requires_arc            = true

  s.dependency              'AFNetworking', '~> 2.0.1'
  s.dependency              'MagicalRecord'
  s.dependency              'NSDate+TimeAgo'
  s.dependency              'MBProgressHUD', '~> 0.8'
  s.dependency              'MSDynamicsDrawerViewController'
  s.dependency              'NJKWebViewProgress'

  s.xcconfig                = {
                                'OTHER_LDFLAGS' => '-ObjC -all_load',
                                'FRAMEWORK_SEARCH_PATHS' => '"${PODS_ROOT}/Spritz-SDK/Spritz-SDK"'
                                }

  s.license                 = {
                                :type => 'Copyright',
                                :text => <<-LICENSE
                                    Copyright 2014 Spritz Technology Inc. All rights reserved.
                                    LICENSE
                                }
end
