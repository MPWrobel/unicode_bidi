# frozen_string_literal: true

require_relative "lib/unicode_bidi/version"

Gem::Specification.new do |spec|
  spec.name = "unicode_bidi"
  spec.version = UnicodeBidi::VERSION
  spec.authors = ["Marcin P. Wróbel"]
  spec.email = ["marcin.wrobel@u2i.com"]

  spec.summary = "unicode-bidi crate wrapper"
  # spec.description = "TODO: Write a longer description or delete this line."
  spec.homepage = "https://github.com/mpwrobel/unicode_bidi"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 3.0.0"
  spec.required_rubygems_version = ">= 3.3.11"

  spec.metadata["allowed_push_host"] = "TODO: Set to your gem server 'https://example.com'"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/mpwrobel/unicode_bidi"
  spec.metadata["changelog_uri"] = "https://github.com/mpwrobel/unicode_bidi/CHANGELOG.md"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  gemspec = File.basename(__FILE__)
  spec.files = IO.popen(%w[git ls-files -z], chdir: __dir__, err: IO::NULL) do |ls|
    ls.readlines("\x0", chomp: true).reject do |f|
      (f == gemspec) ||
        f.start_with?(*%w[bin/ test/ spec/ features/ .git .github appveyor Gemfile])
    end
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]
  spec.extensions = ["ext/unicode_bidi/Cargo.toml"]

  # Uncomment to register a new dependency of your gem
  # spec.add_dependency "example-gem", "~> 1.0"

  # For more information and examples about making a new gem, check out our
  # guide at: https://bundler.io/guides/creating_gem.html
end
