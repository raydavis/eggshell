source 'https://rubygems.org'

# The core framework
# https://github.com/rails/rails
gem 'rails', '3.2.8'

# Postgresql adapter
# This gem forwards to activerecord's default postgresql adapter
gem 'activerecord-postgresql-adapter', '~> 0.0.1'
# We need this in addition to the adapter
# see http://stackoverflow.com/q/2038048/117193
gem 'pg', '~> 0.14.1'

# A JSON implementation as a Ruby extension in C
# http://flori.github.com/json/
gem 'json', '~> 1.7.5'

# Keep env blue/clean
# https://rubygems.org/gems/rails_config
gem 'rails_config', '~> 0.3.1'

# CAS Strategy for OmniAuth
# https://rubygems.org/gems/omniauth-cas
gem 'omniauth-cas', '~> 0.0.7'

# Gems used only for assets and not required
# in production environments by default.
group :assets do

  # This library adds angularjs support to Rails applications
  # https://github.com/ludicast/angular-rails
  gem 'angular-rails', '~> 0.0.12'

  # CSS Framework - also includes Compass and SASS
  # https://github.com/zurb/foundation
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  gem "compass-rails", "~> 1.0.3"
  gem 'zurb-foundation', '~> 3.2.0'

  # Ruby wrapper for UglifyJS JavaScript compressor
  # https://github.com/lautis/uglifier
  gem 'uglifier', '~> 1.3.0'
end

group :development, :test do
  gem 'rspec-rails', "~> 2.0"
  gem 'minitest-reporters'
end
