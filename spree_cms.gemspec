# encoding: UTF-8
Gem::Specification.new do |s|
  s.platform = Gem::Platform::RUBY
  s.name = 'spree_cms'
  s.version = '1.3.34'
  s.summary = 'spree content management'
  s.description = ''
  s.required_ruby_version = '>= 1.8.7'

  s.author = 'Nicolas Pineault'
  s.email = 'nicolaspineault@gmail.com'
  s.homepage = 'http://fungo.ca'

  s.files = Dir['{config}/**/*']
  #s.test_files  = `git ls-files -- {test,spec,features}/*`.split("\n")

  s.require_path = 'lib'
  s.requirements << 'none'

  s.add_dependency 'spree', '1.3.2'
  s.add_dependency 'ckeditor', '4.0.4'
  s.add_dependency 'paperclip', "~> 2.7"

  s.add_development_dependency 'capybara', '~> 1.1.2'
  s.add_development_dependency 'coffee-rails'
  s.add_development_dependency 'factory_girl', '~> 2.6.4'
  s.add_development_dependency 'ffaker'
  s.add_development_dependency 'rspec-rails', '~> 2.9'
  s.add_development_dependency 'sass-rails'
  s.add_development_dependency 'sqlite3'
end
