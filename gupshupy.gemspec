$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "gupshupy/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "gupshupy"
  s.version     = Gupshupy::VERSION
  s.authors     = "Abhinav Saxena"
  s.email       = "abhinav061@gmail.com"
  s.homepage    = "http://abhinavsaxena.com"
  s.summary     = "sms helper for SMSGupShup"
  s.description = "simple to use acts_as module for rails apps"

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 3.1.0"
  s.add_dependency "httpclient"

  s.add_development_dependency "sqlite3"
end
