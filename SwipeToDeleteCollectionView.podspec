Pod::Spec.new do |s|

s.platform = :ios
s.ios.deployment_target = '8.0'
s.name = "SwipeToDeleteCollectionView"
s.summary = "Collection View which support swipe to delete function of TableView"
s.requires_arc = true

s.version = "0.1.6"

s.license = { :type => "MIT", :file => "LICENSE" }

s.author = { "Jozef Matus" => "jozef@matus.sk" }

s.homepage = "https://github.com/beretis/SwipeToDeleteCollectionView"

s.source = { :git => "https://github.com/beretis/SwipeToDeleteCollectionView.git", :tag => "#{s.version}"}


s.framework = "UIKit"
s.dependency 'RxSwift', '~> 3.4.1'
s.dependency 'RxCocoa', '~> 3.4.1'


s.source_files = "SwipeToDeleteCollectionView/**/*.{swift}"
end
