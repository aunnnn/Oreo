# Uncomment the next line to define a global platform for your project
platform :ios, '9.0'

target 'Oreo' do
  use_frameworks!

  pod 'JustRequest'
  pod 'Unbox'
  
  pod 'TinyConstraints'
  
  pod 'Prelude'
  pod 'SwiftKeychainWrapper'  
  pod 'ViewElements'

  target 'OreoTests' do
    inherit! :search_paths
    # Pods for testing
  end
end

target 'OreoAPI' do
    use_frameworks!
    pod 'Prelude'
    pod 'Arcane'
    pod 'JustRequest'
end

post_install do |installer|
    installer.pods_project.targets.each do |target|
        target.build_configurations.each do |config|
            if config.name == 'Debug'
                config.build_settings['OTHER_SWIFT_FLAGS'] = ['$(inherited)', '-Onone']
                config.build_settings['SWIFT_OPTIMIZATION_LEVEL'] = '-Owholemodule'
            end
        end
    end
end
