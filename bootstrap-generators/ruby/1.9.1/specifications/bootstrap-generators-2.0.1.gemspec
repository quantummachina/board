# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{bootstrap-generators}
  s.version = "2.0.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["D\u00E9cio Ferreira"]
  s.date = %q{2012-02-21}
  s.description = %q{Bootstrap-generators provides Twitter Bootstrap generators for Rails 3.1. Checkout http://twitter.github.com/bootstrap.}
  s.email = ["decio.ferreira@decioferreira.com"]
  s.homepage = %q{http://decioferreira.github.com/bootstrap-generators/}
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{bootstrap-generators}
  s.rubygems_version = %q{1.7.2}
  s.summary = %q{Bootstrap-generators provides Twitter Bootstrap generators for Rails 3.1.}

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<bundler>, ["~> 1.0.0"])
      s.add_development_dependency(%q<test-unit>, [">= 0"])
      s.add_development_dependency(%q<rails>, ["~> 3.1"])
      s.add_runtime_dependency(%q<railties>, ["~> 3.1"])
    else
      s.add_dependency(%q<bundler>, ["~> 1.0.0"])
      s.add_dependency(%q<test-unit>, [">= 0"])
      s.add_dependency(%q<rails>, ["~> 3.1"])
      s.add_dependency(%q<railties>, ["~> 3.1"])
    end
  else
    s.add_dependency(%q<bundler>, ["~> 1.0.0"])
    s.add_dependency(%q<test-unit>, [">= 0"])
    s.add_dependency(%q<rails>, ["~> 3.1"])
    s.add_dependency(%q<railties>, ["~> 3.1"])
  end
end
