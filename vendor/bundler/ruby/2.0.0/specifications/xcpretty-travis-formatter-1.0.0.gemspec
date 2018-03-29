# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "xcpretty-travis-formatter"
  s.version = "1.0.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Delisa Mason"]
  s.date = "2017-10-24"
  s.description = "\n  Formatter for xcpretty customized to provide pretty output on TravisCI\n  "
  s.email = ["iskanamagus@gmail.com"]
  s.executables = ["xcpretty-travis-formatter"]
  s.files = ["bin/xcpretty-travis-formatter"]
  s.homepage = "https://github.com/kattrali/xcpretty-travis-formatter"
  s.licenses = ["MIT"]
  s.require_paths = ["lib"]
  s.required_ruby_version = Gem::Requirement.new("~> 2.0")
  s.rubygems_version = "2.0.14.1"
  s.summary = "xcpretty custom formatter for TravisCI"

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<xcpretty>, [">= 0.0.7", "~> 0.2"])
      s.add_development_dependency(%q<bundler>, ["~> 1.3"])
      s.add_development_dependency(%q<rake>, [">= 0"])
      s.add_development_dependency(%q<bacon>, ["~> 1.2"])
    else
      s.add_dependency(%q<xcpretty>, [">= 0.0.7", "~> 0.2"])
      s.add_dependency(%q<bundler>, ["~> 1.3"])
      s.add_dependency(%q<rake>, [">= 0"])
      s.add_dependency(%q<bacon>, ["~> 1.2"])
    end
  else
    s.add_dependency(%q<xcpretty>, [">= 0.0.7", "~> 0.2"])
    s.add_dependency(%q<bundler>, ["~> 1.3"])
    s.add_dependency(%q<rake>, [">= 0"])
    s.add_dependency(%q<bacon>, ["~> 1.2"])
  end
end
