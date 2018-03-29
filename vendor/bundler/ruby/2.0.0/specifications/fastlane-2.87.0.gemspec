# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "fastlane"
  s.version = "2.87.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.metadata = { "docs_url" => "https://docs.fastlane.tools" } if s.respond_to? :metadata=
  s.authors = ["Olivier Halligon", "Joshua Liebowitz", "Maksym Grebenets", "Stefan Natchev", "J\u{e9}r\u{f4}me Lacoste", "Jorge Revuelta H", "Andrew McBurney", "Iulian Onofrei", "Fumiya Nakamura", "Jan Piotrowski", "Aaron Brager", "Jimmy Dee", "Manu Wallner", "Felix Krause", "Kohki Miki", "Helmut Januschka", "Luka Mirosevic", "Danielle Tomlinson", "Josh Holtz", "Matthew Ellis"]
  s.date = "2018-03-23"
  s.description = "The easiest way to automate beta deployments and releases for your iOS and Android apps"
  s.email = ["fastlane@krausefx.com"]
  s.executables = ["bin-proxy", "fastlane"]
  s.files = ["bin/bin-proxy", "bin/fastlane"]
  s.homepage = "https://fastlane.tools"
  s.licenses = ["MIT"]
  s.require_paths = ["credentials_manager/lib", "pem/lib", "snapshot/lib", "frameit/lib", "match/lib", "fastlane_core/lib", "deliver/lib", "scan/lib", "supply/lib", "cert/lib", "fastlane/lib", "spaceship/lib", "pilot/lib", "gym/lib", "precheck/lib", "screengrab/lib", "sigh/lib", "produce/lib"]
  s.required_ruby_version = Gem::Requirement.new(">= 2.0.0")
  s.rubygems_version = "2.0.14.1"
  s.summary = "The easiest way to automate beta deployments and releases for your iOS and Android apps"

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<slack-notifier>, ["< 3.0.0", ">= 2.0.0"])
      s.add_runtime_dependency(%q<xcodeproj>, ["< 2.0.0", ">= 1.5.7"])
      s.add_runtime_dependency(%q<xcpretty>, ["< 1.0.0", ">= 0.2.4"])
      s.add_runtime_dependency(%q<terminal-notifier>, ["< 2.0.0", ">= 1.6.2"])
      s.add_runtime_dependency(%q<terminal-table>, ["< 2.0.0", ">= 1.4.5"])
      s.add_runtime_dependency(%q<plist>, ["< 4.0.0", ">= 3.1.0"])
      s.add_runtime_dependency(%q<CFPropertyList>, ["< 4.0.0", ">= 2.3"])
      s.add_runtime_dependency(%q<addressable>, ["< 3.0.0", ">= 2.3"])
      s.add_runtime_dependency(%q<multipart-post>, ["~> 2.0.0"])
      s.add_runtime_dependency(%q<word_wrap>, ["~> 1.0.0"])
      s.add_runtime_dependency(%q<public_suffix>, ["~> 2.0.0"])
      s.add_runtime_dependency(%q<tty-screen>, ["< 1.0.0", ">= 0.6.3"])
      s.add_runtime_dependency(%q<tty-spinner>, ["< 1.0.0", ">= 0.8.0"])
      s.add_runtime_dependency(%q<babosa>, ["< 2.0.0", ">= 1.0.2"])
      s.add_runtime_dependency(%q<colored>, [">= 0"])
      s.add_runtime_dependency(%q<commander-fastlane>, ["< 5.0.0", ">= 4.4.6"])
      s.add_runtime_dependency(%q<excon>, ["< 1.0.0", ">= 0.45.0"])
      s.add_runtime_dependency(%q<faraday-cookie_jar>, ["~> 0.0.6"])
      s.add_runtime_dependency(%q<fastimage>, ["< 3.0.0", ">= 2.1.0"])
      s.add_runtime_dependency(%q<gh_inspector>, ["< 2.0.0", ">= 1.1.2"])
      s.add_runtime_dependency(%q<highline>, ["< 2.0.0", ">= 1.7.2"])
      s.add_runtime_dependency(%q<json>, ["< 3.0.0"])
      s.add_runtime_dependency(%q<mini_magick>, ["~> 4.5.1"])
      s.add_runtime_dependency(%q<multi_json>, [">= 0"])
      s.add_runtime_dependency(%q<multi_xml>, ["~> 0.5"])
      s.add_runtime_dependency(%q<rubyzip>, ["< 2.0.0", ">= 1.1.0"])
      s.add_runtime_dependency(%q<security>, ["= 0.1.3"])
      s.add_runtime_dependency(%q<xcpretty-travis-formatter>, [">= 0.0.3"])
      s.add_runtime_dependency(%q<dotenv>, ["< 3.0.0", ">= 2.1.1"])
      s.add_runtime_dependency(%q<bundler>, ["< 2.0.0", ">= 1.12.0"])
      s.add_runtime_dependency(%q<faraday>, ["~> 0.9"])
      s.add_runtime_dependency(%q<faraday_middleware>, ["~> 0.9"])
      s.add_runtime_dependency(%q<simctl>, ["~> 1.6"])
      s.add_runtime_dependency(%q<google-api-client>, ["< 0.14.0", ">= 0.13.1"])
      s.add_development_dependency(%q<rake>, ["< 12"])
      s.add_development_dependency(%q<rspec>, ["~> 3.5.0"])
      s.add_development_dependency(%q<rspec_junit_formatter>, ["~> 0.2.3"])
      s.add_development_dependency(%q<pry>, [">= 0"])
      s.add_development_dependency(%q<pry-byebug>, [">= 0"])
      s.add_development_dependency(%q<pry-rescue>, [">= 0"])
      s.add_development_dependency(%q<pry-stack_explorer>, [">= 0"])
      s.add_development_dependency(%q<yard>, ["~> 0.9.11"])
      s.add_development_dependency(%q<webmock>, ["~> 2.3.2"])
      s.add_development_dependency(%q<coveralls>, ["~> 0.8.13"])
      s.add_development_dependency(%q<rubocop>, ["= 0.49.1"])
      s.add_development_dependency(%q<rubocop-require_tools>, [">= 0.1.2"])
      s.add_development_dependency(%q<rb-readline>, [">= 0"])
      s.add_development_dependency(%q<rest-client>, [">= 1.8.0"])
      s.add_development_dependency(%q<fakefs>, ["~> 0.8.1"])
      s.add_development_dependency(%q<sinatra>, ["~> 1.4.8"])
    else
      s.add_dependency(%q<slack-notifier>, ["< 3.0.0", ">= 2.0.0"])
      s.add_dependency(%q<xcodeproj>, ["< 2.0.0", ">= 1.5.7"])
      s.add_dependency(%q<xcpretty>, ["< 1.0.0", ">= 0.2.4"])
      s.add_dependency(%q<terminal-notifier>, ["< 2.0.0", ">= 1.6.2"])
      s.add_dependency(%q<terminal-table>, ["< 2.0.0", ">= 1.4.5"])
      s.add_dependency(%q<plist>, ["< 4.0.0", ">= 3.1.0"])
      s.add_dependency(%q<CFPropertyList>, ["< 4.0.0", ">= 2.3"])
      s.add_dependency(%q<addressable>, ["< 3.0.0", ">= 2.3"])
      s.add_dependency(%q<multipart-post>, ["~> 2.0.0"])
      s.add_dependency(%q<word_wrap>, ["~> 1.0.0"])
      s.add_dependency(%q<public_suffix>, ["~> 2.0.0"])
      s.add_dependency(%q<tty-screen>, ["< 1.0.0", ">= 0.6.3"])
      s.add_dependency(%q<tty-spinner>, ["< 1.0.0", ">= 0.8.0"])
      s.add_dependency(%q<babosa>, ["< 2.0.0", ">= 1.0.2"])
      s.add_dependency(%q<colored>, [">= 0"])
      s.add_dependency(%q<commander-fastlane>, ["< 5.0.0", ">= 4.4.6"])
      s.add_dependency(%q<excon>, ["< 1.0.0", ">= 0.45.0"])
      s.add_dependency(%q<faraday-cookie_jar>, ["~> 0.0.6"])
      s.add_dependency(%q<fastimage>, ["< 3.0.0", ">= 2.1.0"])
      s.add_dependency(%q<gh_inspector>, ["< 2.0.0", ">= 1.1.2"])
      s.add_dependency(%q<highline>, ["< 2.0.0", ">= 1.7.2"])
      s.add_dependency(%q<json>, ["< 3.0.0"])
      s.add_dependency(%q<mini_magick>, ["~> 4.5.1"])
      s.add_dependency(%q<multi_json>, [">= 0"])
      s.add_dependency(%q<multi_xml>, ["~> 0.5"])
      s.add_dependency(%q<rubyzip>, ["< 2.0.0", ">= 1.1.0"])
      s.add_dependency(%q<security>, ["= 0.1.3"])
      s.add_dependency(%q<xcpretty-travis-formatter>, [">= 0.0.3"])
      s.add_dependency(%q<dotenv>, ["< 3.0.0", ">= 2.1.1"])
      s.add_dependency(%q<bundler>, ["< 2.0.0", ">= 1.12.0"])
      s.add_dependency(%q<faraday>, ["~> 0.9"])
      s.add_dependency(%q<faraday_middleware>, ["~> 0.9"])
      s.add_dependency(%q<simctl>, ["~> 1.6"])
      s.add_dependency(%q<google-api-client>, ["< 0.14.0", ">= 0.13.1"])
      s.add_dependency(%q<rake>, ["< 12"])
      s.add_dependency(%q<rspec>, ["~> 3.5.0"])
      s.add_dependency(%q<rspec_junit_formatter>, ["~> 0.2.3"])
      s.add_dependency(%q<pry>, [">= 0"])
      s.add_dependency(%q<pry-byebug>, [">= 0"])
      s.add_dependency(%q<pry-rescue>, [">= 0"])
      s.add_dependency(%q<pry-stack_explorer>, [">= 0"])
      s.add_dependency(%q<yard>, ["~> 0.9.11"])
      s.add_dependency(%q<webmock>, ["~> 2.3.2"])
      s.add_dependency(%q<coveralls>, ["~> 0.8.13"])
      s.add_dependency(%q<rubocop>, ["= 0.49.1"])
      s.add_dependency(%q<rubocop-require_tools>, [">= 0.1.2"])
      s.add_dependency(%q<rb-readline>, [">= 0"])
      s.add_dependency(%q<rest-client>, [">= 1.8.0"])
      s.add_dependency(%q<fakefs>, ["~> 0.8.1"])
      s.add_dependency(%q<sinatra>, ["~> 1.4.8"])
    end
  else
    s.add_dependency(%q<slack-notifier>, ["< 3.0.0", ">= 2.0.0"])
    s.add_dependency(%q<xcodeproj>, ["< 2.0.0", ">= 1.5.7"])
    s.add_dependency(%q<xcpretty>, ["< 1.0.0", ">= 0.2.4"])
    s.add_dependency(%q<terminal-notifier>, ["< 2.0.0", ">= 1.6.2"])
    s.add_dependency(%q<terminal-table>, ["< 2.0.0", ">= 1.4.5"])
    s.add_dependency(%q<plist>, ["< 4.0.0", ">= 3.1.0"])
    s.add_dependency(%q<CFPropertyList>, ["< 4.0.0", ">= 2.3"])
    s.add_dependency(%q<addressable>, ["< 3.0.0", ">= 2.3"])
    s.add_dependency(%q<multipart-post>, ["~> 2.0.0"])
    s.add_dependency(%q<word_wrap>, ["~> 1.0.0"])
    s.add_dependency(%q<public_suffix>, ["~> 2.0.0"])
    s.add_dependency(%q<tty-screen>, ["< 1.0.0", ">= 0.6.3"])
    s.add_dependency(%q<tty-spinner>, ["< 1.0.0", ">= 0.8.0"])
    s.add_dependency(%q<babosa>, ["< 2.0.0", ">= 1.0.2"])
    s.add_dependency(%q<colored>, [">= 0"])
    s.add_dependency(%q<commander-fastlane>, ["< 5.0.0", ">= 4.4.6"])
    s.add_dependency(%q<excon>, ["< 1.0.0", ">= 0.45.0"])
    s.add_dependency(%q<faraday-cookie_jar>, ["~> 0.0.6"])
    s.add_dependency(%q<fastimage>, ["< 3.0.0", ">= 2.1.0"])
    s.add_dependency(%q<gh_inspector>, ["< 2.0.0", ">= 1.1.2"])
    s.add_dependency(%q<highline>, ["< 2.0.0", ">= 1.7.2"])
    s.add_dependency(%q<json>, ["< 3.0.0"])
    s.add_dependency(%q<mini_magick>, ["~> 4.5.1"])
    s.add_dependency(%q<multi_json>, [">= 0"])
    s.add_dependency(%q<multi_xml>, ["~> 0.5"])
    s.add_dependency(%q<rubyzip>, ["< 2.0.0", ">= 1.1.0"])
    s.add_dependency(%q<security>, ["= 0.1.3"])
    s.add_dependency(%q<xcpretty-travis-formatter>, [">= 0.0.3"])
    s.add_dependency(%q<dotenv>, ["< 3.0.0", ">= 2.1.1"])
    s.add_dependency(%q<bundler>, ["< 2.0.0", ">= 1.12.0"])
    s.add_dependency(%q<faraday>, ["~> 0.9"])
    s.add_dependency(%q<faraday_middleware>, ["~> 0.9"])
    s.add_dependency(%q<simctl>, ["~> 1.6"])
    s.add_dependency(%q<google-api-client>, ["< 0.14.0", ">= 0.13.1"])
    s.add_dependency(%q<rake>, ["< 12"])
    s.add_dependency(%q<rspec>, ["~> 3.5.0"])
    s.add_dependency(%q<rspec_junit_formatter>, ["~> 0.2.3"])
    s.add_dependency(%q<pry>, [">= 0"])
    s.add_dependency(%q<pry-byebug>, [">= 0"])
    s.add_dependency(%q<pry-rescue>, [">= 0"])
    s.add_dependency(%q<pry-stack_explorer>, [">= 0"])
    s.add_dependency(%q<yard>, ["~> 0.9.11"])
    s.add_dependency(%q<webmock>, ["~> 2.3.2"])
    s.add_dependency(%q<coveralls>, ["~> 0.8.13"])
    s.add_dependency(%q<rubocop>, ["= 0.49.1"])
    s.add_dependency(%q<rubocop-require_tools>, [">= 0.1.2"])
    s.add_dependency(%q<rb-readline>, [">= 0"])
    s.add_dependency(%q<rest-client>, [">= 1.8.0"])
    s.add_dependency(%q<fakefs>, ["~> 0.8.1"])
    s.add_dependency(%q<sinatra>, ["~> 1.4.8"])
  end
end
