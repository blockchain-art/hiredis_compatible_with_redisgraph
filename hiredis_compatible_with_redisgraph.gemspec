require File.expand_path("../lib/hiredis/version", __FILE__)

Gem::Specification.new do |s|
  s.name = "hiredis_compatible_with_redisgraph"
  s.version = Hiredis::VERSION
  s.homepage = "https://github.com/blockchain-art/hiredis_fork"
  s.authors = ["Lukas Mickevicius"]
  s.email = ["uikid93@gmail.com"]
  s.license = 'BSD-3-Clause'
  s.summary = "Ruby wrapper for hiredis (protocol serialization/deserialization and blocking I/O) compatible with RedisGraph"
  s.description = s.summary

  s.require_path = "lib"
  s.files = []

  if RUBY_PLATFORM =~ /java/
    s.platform = "java"
  else
    s.extensions = Dir["ext/**/extconf.rb"]
    s.files += Dir["ext/**/*.{rb,c,h}"]
    s.files += Dir["dependency/hiredis/*.{c,h}"] -
      Dir["dependency/hiredis/example*"] +
      Dir["dependency/hiredis/COPYING"] +
      Dir["dependency/hiredis/Makefile"]
  end

  s.files += Dir["lib/**/*.rb"]
  s.files += %w(COPYING Rakefile)

  s.add_development_dependency "rake", "10.0"
  s.add_development_dependency "rake-compiler", "~> 0.7.1"
  s.add_development_dependency "minitest", "~> 5.5.1"
end
