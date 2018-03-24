# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "security"
  s.version = "0.1.3"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Mattt Thompson"]
  s.date = "2014-08-05"
  s.description = "Library for interacting with the Mac OS X Keychain"
  s.email = "m@mattt.me"
  s.homepage = "http://mattt.me"
  s.require_paths = ["lib"]
  s.rubygems_version = "2.0.14.1"
  s.summary = "Security"

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<rspec>, ["~> 0.6.1"])
      s.add_development_dependency(%q<rake>, ["~> 0.9.2"])
    else
      s.add_dependency(%q<rspec>, ["~> 0.6.1"])
      s.add_dependency(%q<rake>, ["~> 0.9.2"])
    end
  else
    s.add_dependency(%q<rspec>, ["~> 0.6.1"])
    s.add_dependency(%q<rake>, ["~> 0.9.2"])
  end
end
