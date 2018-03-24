# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "plist"
  s.version = "3.3.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Ben Bleything", "Patrick May"]
  s.bindir = "exe"
  s.date = "2017-04-28"
  s.description = "Plist is a library to manipulate Property List files, also known as plists. It can parse plist files into native Ruby data structures as well as generating new plist files from your Ruby objects."
  s.homepage = "https://github.com/patsplat/plist"
  s.licenses = ["MIT"]
  s.require_paths = ["lib"]
  s.rubygems_version = "2.0.14.1"
  s.summary = "All-purpose Property List manipulation library"

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<bundler>, ["~> 1.14"])
      s.add_development_dependency(%q<rake>, ["~> 10.5"])
      s.add_development_dependency(%q<test-unit>, ["~> 1.2"])
    else
      s.add_dependency(%q<bundler>, ["~> 1.14"])
      s.add_dependency(%q<rake>, ["~> 10.5"])
      s.add_dependency(%q<test-unit>, ["~> 1.2"])
    end
  else
    s.add_dependency(%q<bundler>, ["~> 1.14"])
    s.add_dependency(%q<rake>, ["~> 10.5"])
    s.add_dependency(%q<test-unit>, ["~> 1.2"])
  end
end
