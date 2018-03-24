# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "dotenv"
  s.version = "2.2.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Brandon Keepers"]
  s.date = "2017-04-28"
  s.description = "Loads environment variables from `.env`."
  s.email = ["brandon@opensoul.org"]
  s.executables = ["dotenv"]
  s.files = ["bin/dotenv"]
  s.homepage = "https://github.com/bkeepers/dotenv"
  s.licenses = ["MIT"]
  s.require_paths = ["lib"]
  s.rubygems_version = "2.0.14.1"
  s.summary = "Loads environment variables from `.env`."

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<rake>, [">= 0"])
      s.add_development_dependency(%q<rspec>, [">= 0"])
      s.add_development_dependency(%q<rubocop>, ["~> 0.40.0"])
    else
      s.add_dependency(%q<rake>, [">= 0"])
      s.add_dependency(%q<rspec>, [">= 0"])
      s.add_dependency(%q<rubocop>, ["~> 0.40.0"])
    end
  else
    s.add_dependency(%q<rake>, [">= 0"])
    s.add_dependency(%q<rspec>, [">= 0"])
    s.add_dependency(%q<rubocop>, ["~> 0.40.0"])
  end
end
