
Pod::Spec.new do |spec|

  spec.name         = "ProfileCard"
  spec.version      = "0.0.1"
  spec.summary      = "This library helps you to create photo id in single line of code."

  spec.description  = <<-DESC
		 PhotoId card layout library. You can customise as per your requirements.
                   DESC

  spec.homepage     = "https://github.com/ravish21/IdCardFramework"
  spec.license      = { :type => "MIT", :file => "LICENSE" }
  spec.author       = { "Ravish Kumar" => "ravish.93srivastava@gmail.com" }
 

  spec.ios.deployment_target = "12.1"
  spec.swift_version = "5.0"

  spec.source       = { :git => "https://github.com/ravish21/IdCardFramework.git", :tag => "#{spec.version}" }


  spec.source_files  = "ProfileCard", "ProfileCard/**/*.{h,m}"
  spec.exclude_files = "ProfileCard/Exclude"

 

end
