require "qingting_api/version"
require 'qingting_api/config'
require "qingting_api/utils/http"
require 'qingting_api/account'
require 'qingting_api/request'
require 'qingting_api/qing_ting'


unless defined? ActiveRecord
  begin
    require 'active_record'
  rescue LoadError; end
end

module QingtingApi
  include QingTing

end
