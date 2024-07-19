# frozen_string_literal: true

require "bundler/gem_tasks"
require "rspec/core/rake_task"

RSpec::Core::RakeTask.new(:spec)

require "rb_sys/extensiontask"

task build: :compile

GEMSPEC = Gem::Specification.load("unicode_bidi.gemspec")

RbSys::ExtensionTask.new("unicode_bidi", GEMSPEC) do |ext|
  ext.lib_dir = "lib/unicode_bidi"
end

task default: %i[compile spec]
