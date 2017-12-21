Gem::Specification.new do |gem|
  gem.name                  = 'mobiusrb'
  gem.version               = '0.1.1'
  gem.date                  = '2017-12-21'
  gem.authors               = ['Gleb Pospelov']
  gem.summary               = 'Mobius Ruby API Client'
  gem.description           = 'Mobius Ruby API Client'
  gem.email                 = 'support@mobius.network'
  gem.files                 = `git ls-files`.split("\n")
  gem.homepage              = 'https://github.com/mobius-network/mobius-ruby'
  gem.license               = 'MIT'
  gem.required_ruby_version = '>= 2.2'
  gem.require_paths         = ['lib']

  gem.add_dependency 'http', '~> 3.0.0'
end
