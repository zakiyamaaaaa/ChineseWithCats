# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "google-api-client"
  s.version = "0.13.6"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Steven Bazyl", "Tim Emiola", "Sergio Gomes", "Bob Aman"]
  s.date = "2017-09-11"
  s.email = ["sbazyl@google.com"]
  s.executables = ["generate-api"]
  s.files = ["bin/generate-api"]
  s.homepage = "https://github.com/google/google-api-ruby-client"
  s.licenses = ["Apache-2.0"]
  s.require_paths = ["lib", "generated", "third_party"]
  s.required_ruby_version = Gem::Requirement.new("~> 2.0")
  s.rubygems_version = "2.0.14.1"
  s.summary = "Client for accessing Google APIs"

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<representable>, ["~> 3.0"])
      s.add_runtime_dependency(%q<retriable>, ["< 4.0", ">= 2.0"])
      s.add_runtime_dependency(%q<addressable>, [">= 2.5.1", "~> 2.5"])
      s.add_runtime_dependency(%q<mime-types>, ["~> 3.0"])
      s.add_runtime_dependency(%q<googleauth>, ["~> 0.5"])
      s.add_runtime_dependency(%q<httpclient>, ["< 3.0", ">= 2.8.1"])
      s.add_development_dependency(%q<thor>, ["~> 0.19"])
      s.add_development_dependency(%q<activesupport>, ["< 5.1", ">= 4.2"])
    else
      s.add_dependency(%q<representable>, ["~> 3.0"])
      s.add_dependency(%q<retriable>, ["< 4.0", ">= 2.0"])
      s.add_dependency(%q<addressable>, [">= 2.5.1", "~> 2.5"])
      s.add_dependency(%q<mime-types>, ["~> 3.0"])
      s.add_dependency(%q<googleauth>, ["~> 0.5"])
      s.add_dependency(%q<httpclient>, ["< 3.0", ">= 2.8.1"])
      s.add_dependency(%q<thor>, ["~> 0.19"])
      s.add_dependency(%q<activesupport>, ["< 5.1", ">= 4.2"])
    end
  else
    s.add_dependency(%q<representable>, ["~> 3.0"])
    s.add_dependency(%q<retriable>, ["< 4.0", ">= 2.0"])
    s.add_dependency(%q<addressable>, [">= 2.5.1", "~> 2.5"])
    s.add_dependency(%q<mime-types>, ["~> 3.0"])
    s.add_dependency(%q<googleauth>, ["~> 0.5"])
    s.add_dependency(%q<httpclient>, ["< 3.0", ">= 2.8.1"])
    s.add_dependency(%q<thor>, ["~> 0.19"])
    s.add_dependency(%q<activesupport>, ["< 5.1", ">= 4.2"])
  end
end
