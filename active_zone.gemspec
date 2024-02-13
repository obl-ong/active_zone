require_relative "lib/active_zone/version"

Gem::Specification.new do |spec|
  spec.name        = "active_zone"
  spec.version     = ActiveZone::VERSION
  spec.authors     = ["Obl.ong", "Reese Armstrong"]
  spec.email       = ["team@obl.ong"]
  spec.homepage    = "https://github.com/obl-ong/active_zone"
  spec.summary     = "Manage database-backed DNS zones with Rails"
  spec.description = "A Rails engine for managing database-backed DNS zones with various nameserver adapters."
  spec.license     = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the "allowed_push_host"
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  spec.metadata["allowed_push_host"] = "https://rubygems.org"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/obl-ong/active_zone"
  spec.metadata["changelog_uri"] = "https://github.com/obl-ong/active_zone/releases"

  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    Dir["{app,config,db,lib}/**/*", "LICENSE.md", "Rakefile", "README.md"]
  end

  spec.add_dependency "rails", ">= 7.1.3"
end
