# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

def common_pods
  pod 'Alamofire'
  pod 'AlamofireImage', '~> 3.3'
  pod 'RxSwift',    '~> 4.0'
  pod 'NVActivityIndicatorView'
end

target 'DeezerSample' do
  # Comment the next line if you're not using Swift and don't want to use dynamic frameworks
  use_frameworks!

  # Pods for DeezerSample
  common_pods
  
  target 'DeezerSampleTests' do
    inherit! :search_paths
    
    # Pods for testing
    common_pods
  end

  target 'DeezerSampleUITests' do
    inherit! :search_paths
    # Pods for testing
  end

end
