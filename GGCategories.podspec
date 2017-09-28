
Pod::Spec.new do |s|

  s.name         = "GGCategories"
  s.version      = "0.1.5"
  s.summary      = "My Categories."

  s.description  = <<-DESC
		My Categories. https://github.com/Zhangguiguang/GGCategories
                   DESC

  s.homepage     = "https://github.com/Zhangguiguang/GGCategories"
  
  s.license      = "MIT"
  
  s.author             = { "张贵广" => "guiguangzhang@epiclouds.net" }

  s.ios.deployment_target = "8.0"
  
  s.source       = { :git => "https://github.com/Zhangguiguang/GGCategories.git", :tag => s.version }

  s.source_files  = "GGCategories/GGCategories/*{h,m}"

  s.public_header_files = "GGCategories/GGCategories/*.h"

  s.resources = "GGCategories/Resources/*"

  s.requires_arc = true

end
