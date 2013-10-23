Pod::Spec.new do |s|
  s.name         = "MGIOUtils"
  s.version      = "0.0.1"
  s.summary      = "Simple categories to make searching, opening, reading, and writing on files in iOS a one line operation."

  s.description  = <<-DESC
                   Simple categories to make searching, opening, reading, and writing on files in iOS a one line operation.

                   `NSFileManager+MGIOUtils` provides quick methods to find out if a file exists, and it's path. 
                   `NSObject+MGIOUtils` has a lot of methods to write and read `NSArray` and `NSDictionaries` to files. 
                   Any many more handy things, take a look at the headers!
                   DESC

  s.homepage     = "https://github.com/mokagio/MGIOUtils"
  s.license      = { :type => 'MIT', :file => 'LICENSE' }
  s.author       = { "Giovanni Lodi" => "mokagio42@gmail.com" }
  s.platform     = :ios
  s.source       = { :git => "https://github.com/mokagio/MGIOUtils.git", :commit => "b0eed34484cf21fac1e7e05536fe536788f5252a" }
  s.source_files  = 'MGIOUtils'
end
