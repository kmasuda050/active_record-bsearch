# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "active_record/bsearch/version"

Gem::Specification.new do |spec|
  spec.name          = "active_record-bsearch"
  spec.version       = ActiveRecord::Bsearch::VERSION
  spec.authors       = ["Kazuhiro Masuda"]
  spec.email         = ["kmasuda050@gmail.com"]

  spec.summary       = %q{Binary search extension for ActiveRecord}
  spec.description   = %q{Binary search extension for ActiveRecord.}
  spec.homepage      = "https://github.com/kmasuda050/active_record-bsearch"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "activerecord", ">= 5.0"
  spec.add_development_dependency "bundler", "~> 1.15"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "sqlite3", "~> 1.3.13"
end
