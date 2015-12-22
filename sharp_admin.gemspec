$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "sharp_admin/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "sharp_admin"
  s.version     = EasyAdmin::VERSION
  s.authors     = ["sharp"]
  s.email       = ["liuqiang_0701@163.com"]
  s.homepage    = "https://github.com/sharp/sharp_admin"
  s.summary     = "generator for your admin."
  s.description = "generator for your admin."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 4.0"
  s.add_dependency "haml", '> 4.0'
  s.add_dependency "rspec-activemodel-mocks"
end
