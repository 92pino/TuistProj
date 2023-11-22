# Uncomment the next line to define a global platform for your project
platform :ios, '14.0'
inhibit_all_warnings!
# Comment the next line if you don't want to use dynamic frameworks
use_frameworks!

post_install do |installer|
  installer.pods_project.build_configurations.each do |config|
    config.build_settings['CODE_SIGNING_ALLOWED'] = 'NO'
  end
end

workspace 'TuistDemo.xcworkspace'

## App Layer
target 'A_App' do
  project 'Projects/App/A_App.xcodeproj'
end

## Core Layer
target 'ACore' do
  project 'Projects/Core/ACore/ACore.xcodeproj'
end

## Features Layer
target 'AFeature' do
  project 'Projects/Features/AFeature/AFeature.xcodeproj'
end

## UI Layer
target 'Color' do
  project 'Projects/UI/Color/Color.xcodeproj'
end

