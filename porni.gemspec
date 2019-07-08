
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "porni/version"

Gem::Specification.new do |spec|
  spec.name          = "porni"
  spec.version       = Porni::VERSION
  spec.authors       = ["FastFaps"]
  spec.email         = ["marvelousito@fastfaps.com"]
  spec.summary       = "API from principal porn sites"
  spec.description   = "Gem works with pornhub.com, redtube.com, porn.com"
  spec.homepage      = "TODO: Put your gem's website or public repo URL here."
  spec.license       = "MIT"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = %w(porni.gemspec) + Dir['lib/**/*.rb']
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 2.0"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "byebug"
  spec.add_dependency 'http', '~> 4.1'
  spec.add_dependency 'oj', '~> 3.7'
  spec.add_dependency 'addressable', '~> 2.6'
end
