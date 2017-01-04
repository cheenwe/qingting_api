require "qingting/version"
require 'qingting/config'
require "qingting/utils/http"
require 'qingting/utils/request'
require 'qingting/qing_ting'
require 'qingting/api/base'
require 'qingting/api/account'
require 'qingting/api/category'

module QingtingApi
  include Qingting
  include Qingting::Utils
  include Qingting::Utils::Request
  include Qingting::Api::Account
  include Qingting::Api::Category

end
