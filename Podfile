platform :ios, '7.0'

pod 'CocoaLumberjack', '~> 1.6.2'

target :"MKPersistentQueueTests", :exclusive => true do
    pod 'Kiwi/XCTest', '~> 2.2.3'
end

post_install do |installer|
    installer.project.targets.each do |target|
        target.build_configurations.each do |config|
            config.build_settings['ARCHS'] = "armv7 armv7s"
        end
    end
end