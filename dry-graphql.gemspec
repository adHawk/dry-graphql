# frozen_string_literal: true

lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'dry/graphql/version'

Gem::Specification.new do |spec|
  spec.name          = 'dry-graphql'
  spec.version       = Dry::GraphQL::VERSION
  spec.authors       = ['Ian Ker-Seymer']
  spec.email         = ['i.kerseymer@gmail.com']

  spec.summary       = 'Integrate dry-types/dry-struct with graphql-ruby'
  spec.description   = 'Adds functionality to make dry-types/dry-struct play nicely with graphql-ruby'
  spec.homepage      = 'https://github.com/adhawk/dry-graphql'
  spec.license       = 'MIT'

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  # if spec.respond_to?(:metadata)
  #   spec.metadata['allowed_push_host'] = 'https//rubygems.org'
  # else
  #   raise 'RubyGems 2.0 or newer is required to protect against ' \
  #     'public gem pushes.'
  # end

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_runtime_dependency 'dry-struct', '~> 1.0'
  spec.add_runtime_dependency 'dry-types', '>= 1.1.1', '< 1.3.0'
  spec.add_runtime_dependency 'graphql', '~> 1.9.0'

  spec.add_development_dependency 'appraisal'
  spec.add_development_dependency 'bundler', '~> 1.16'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
end
