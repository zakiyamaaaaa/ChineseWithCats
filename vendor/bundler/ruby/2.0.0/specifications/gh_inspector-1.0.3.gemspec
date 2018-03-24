# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "gh_inspector"
  s.version = "1.0.3"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Orta Therox", "Felix Krause"]
  s.date = "2017-01-11"
  s.description = "Search through GitHub issues for your project for existing issues about a Ruby Error."
  s.email = ["orta.therox@gmail.com", "gh_inspector@krausefx.com"]
  s.homepage = "https://github.com/orta/gh_inspector"
  s.licenses = ["MIT"]
  s.require_paths = ["lib"]
  s.rubygems_version = "2.0.14.1"
  s.summary = "Search through GitHub issues for your project for existing issues about a Ruby Error."

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<bundler>, ["~> 1.11"])
      s.add_development_dependency(%q<rake>, ["~> 10.0"])
      s.add_development_dependency(%q<rspec>, ["~> 3.0"])
      s.add_development_dependency(%q<pry>, ["~> 0.6"])
      s.add_development_dependency(%q<rubocop>, ["> 0", "~> 0"])
    else
      s.add_dependency(%q<bundler>, ["~> 1.11"])
      s.add_dependency(%q<rake>, ["~> 10.0"])
      s.add_dependency(%q<rspec>, ["~> 3.0"])
      s.add_dependency(%q<pry>, ["~> 0.6"])
      s.add_dependency(%q<rubocop>, ["> 0", "~> 0"])
    end
  else
    s.add_dependency(%q<bundler>, ["~> 1.11"])
    s.add_dependency(%q<rake>, ["~> 10.0"])
    s.add_dependency(%q<rspec>, ["~> 3.0"])
    s.add_dependency(%q<pry>, ["~> 0.6"])
    s.add_dependency(%q<rubocop>, ["> 0", "~> 0"])
  end
end
