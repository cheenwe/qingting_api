require "qingting_api/version"
require 'qingting_api/config'
require 'qingting_api/request'

require 'qingting_api/account'

unless defined? ActiveRecord
  begin
    require 'active_record'
  rescue LoadError; end
end

module QingtingApi
  include QingtingApi::Base

end
