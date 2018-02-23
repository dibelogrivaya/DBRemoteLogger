Pod::Spec.new do |s|
  s.name         = "DBRemoteLogger"
  s.version      = "1.2"
  s.summary      = "A custom CocoaLumberjack logger for remote logging through Antenna"

  s.description  = <<-DESC
                   A custom CocoaLumberjack logger for remote logging through Antenna.
                   * [Antenna](https://github.com/mattt/Antenna)
                   * [CocoaLumberjack](https://github.com/CocoaLumberjack/CocoaLumberjack)
                   DESC

  s.homepage     = "https://github.com/dibelogrivaya/DBRemoteLogger"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author             = { "Diana Belogrivaya" => "diana.belogrivaya@gmail.com" }
  s.platform     = :ios, "8.0"
  s.source       = { :git => "git@github.com:dibelogrivaya/DBRemoteLogger.git", :tag => s.version }
  s.source_files  = "DBRemoteLogger"
  s.requires_arc = true
  s.dependency "Antenna", '2.1'
  s.dependency "CocoaLumberjack", '3.4.1'
end
