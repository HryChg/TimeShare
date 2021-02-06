# Uncomment the next line to define a global platform for your project
platform :ios, '13.0'

target 'TimeShare' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

  # Pods for TimeShare
  # add pods for desired Firebase products
  # https://firebase.google.com/docs/ios/setup#available-pods
  pod 'Firebase/Auth'
  pod 'Firebase/Firestore'
  pod 'GoogleSignIn'
  pod 'GoogleAnalytics'
  pod 'TransitionButton'
  pod 'Charts'
  pod 'Google-Mobile-Ads-SDK', '7.69.0'

  post_install do |installer|
    installer.pods_project.targets.each do |target|
      target.build_configurations.each do |config|
        config.build_settings.delete 'IPHONEOS_DEPLOYMENT_TARGET'
      end
    end
  end

  target 'TimeShareTests' do
    inherit! :search_paths
    # Pods for testing
  end

  target 'TimeShareUITests' do
    # Pods for testing
  end

end
