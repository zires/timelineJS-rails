# -*- encoding: utf-8 -*-

require File.expand_path('../lib/timelineJS/rails/version', __FILE__)

Gem::Specification.new do |s|
  s.name = 'timelineJS_rails'
  s.version = TimelineJS::Rails::VERSION
  s.authors = ['zires']
  s.email = ['zshuaibin@gmail.com']
  s.homepage = 'https://github.com/zires/timelineJS-rails'
  s.summary = 'timelineJS packaged for the Rails asset pieline'
  s.description = "timelineJS resources files packaged for the Rails asset pieline"

  s.files = `git ls-files`.split("\n")

  s.add_dependency "jquery-rails"
end
