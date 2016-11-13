require 'pathname'
require 'yaml'

require 'rubocop'

require 'rubocop/chef'
require 'rubocop/chef/version'
require 'rubocop/chef/inject'
# require 'rubocop/chef/top_level_describe'
# require 'rubocop/chef/wording'
# require 'rubocop/chef/util'
# require 'rubocop/chef/language'
# require 'rubocop/chef/language/node_pattern'
require 'rubocop/chef/cookbook_only'

RuboCop::Chef::Inject.defaults!

# cops
require 'rubocop/cop/chef/attribute_keys'
require 'rubocop/cop/chef/file_mode'
require 'rubocop/cop/chef/service_resource'
