# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'qingting/version'

Gem::Specification.new do |s|
  s.name          = "qingting_api"
  s.version       = Qingting::VERSION
  s.authors       = ["cheenwe"]
  s.email         = ["cxhyun@126.com"]

  s.summary       = "QingtingFM ruby api"
  s.description   = "蜻蜓 FM Ruby API"
  s.homepage      = "https://github.com/cheenwe/qingting_api"
  s.license       = "MIT"

  s.files         = `git ls-files`.split($/)
  s.executables   = s.files.grep(%r{^bin/}) { |f| File.basename(f) }
  s.test_files    = s.files.grep(%r{^(test|spec|features)/})
  s.require_paths = ['lib']


  # s.add_dependency 'activerecord', ['>= 3.0']
  # s.add_dependency 'activesupport', ['>= 3.0']

  s.add_development_dependency 'bundler', ['>= 1.0.0']
  s.add_development_dependency 'rake', ['>= 0']
  # s.add_development_dependency 'rails', ['>= 3.1.0']
  # s.add_development_dependency "rspec"
end
