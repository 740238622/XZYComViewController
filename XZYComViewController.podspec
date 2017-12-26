Pod::Spec.new do |s|
  s.name         = "XZYComViewController"    #存储库名称
  s.version      = "1.3.5"      #版本号，与tag值一致
  s.summary      = "自己封装的UIViewController"  #简介
  s.description  = "适用于绝大多数的软件框架，加入了iPhoneX布局"  #描述
  s.homepage     = "https://github.com/740238622/XZYComViewController"      #项目主页，不是git地址
  s.license      = { :type => "MIT", :file => "LICENSE" }   #开源协议
  s.author       = { "xuziyou" => "740238622@qq.com" }  #作者
  s.platform     = :ios, "9.0"                  #支持的平台和版本号
  s.source       = { :git => "https://github.com/740238622/XZYComViewController.git", :tag => "1.3.5" }         #存储库的git地址，以及tag值
  s.source_files = "XZYComViewController/Classes/**/*.{h,m}" #需要托管的源代码路径
  s.resources    = "XZYComViewController/Classes/**/*.png"
  s.requires_arc = true #是否支持ARC
  # s.dependency 'MBProgressHUD', '1.1.0'
  s.dependency "MBProgressHUD"
  s.dependency "XZYMyUtil"
end