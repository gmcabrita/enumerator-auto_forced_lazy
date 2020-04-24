# frozen_string_literal: true

$:.push File.expand_path("../lib", __FILE__)

Gem::Specification.new do |spec|
  spec.name = "enumerator-auto_forced_lazy"
  spec.version = "0.1.1"
  spec.platform = Gem::Platform::RUBY
  spec.authors = ["Gonçalo Cabrita"]
  spec.email = "_@gmcabrita.com"
  spec.licenses = ["MIT"]
  spec.summary = "Provides an AutoForcedLazy class that automatically forces the computation of an Enumerator::Lazy when needed."
  spec.description = spec.summary
  spec.homepage = "https://github.com/gmcabrita/enumerator-auto_forced_lazy"
  spec.metadata = {"source_code_uri" => "https://github.com/gmcabrita/enumerator-auto_forced_lazy"}

  spec.files = Dir["LICENSE", "README.md", "enumerator-auto_forced_lazy.gemspec", "lib/**/*"]
  spec.require_paths = ["lib"]

  spec.metadata["allowed_push_host"] = "https://rubygems.org"
  spec.metadata["source_code_uri"] = "https://github.com/gmcabrita/enumerator-auto_forced_lazy"
  spec.metadata["bug_tracker_uri"] = "https://github.com/gmcabrita/enumerator-auto_forced_lazy/issues"

  spec.required_ruby_version = ">= 2.4.0"

  spec.add_development_dependency "bundler"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "standardrb"
end
