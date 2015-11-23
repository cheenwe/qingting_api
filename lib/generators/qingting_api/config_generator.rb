require 'rails/generators'
require 'rails/generators/active_record'

module QingtingApi
  module Generators
    class ConfigGenerator < Rails::Generators::Base
      source_root File.expand_path(File.join(File.dirname(__FILE__), 'templates'))

      desc <<-DESC
Description:
    Copies QingtingApi configuration file to your application's initializer directory.
DESC

      def copy_config_file
        template 'qingting_api_config.rb', 'config/initializers/qingting_api_config.rb'
      end
    end
  end
end
