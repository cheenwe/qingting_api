require "qingting/version"
require 'qingting/config'
require "qingting/utils/http"
require 'qingting/utils/request'
require 'qingting/qing_ting'
require 'qingting/api/base'
require 'qingting/api/account'
require 'qingting/api/category'
require 'qingting/api/ondemand'
require 'qingting/api/live'
require 'qingting/api/podcaster'
require 'qingting/api/billboard'
require 'qingting/api/recent'



module QingtingApi
  include Qingting
  include Qingting::Utils
  include Qingting::Api
  include Qingting::Api::Account
  include Qingting::Api::Category
  include Qingting::Api::Ondemand
  include Qingting::Api::Live
  include Qingting::Api::Podcaster
  include Qingting::Api::Billboard
  include Qingting::Api::Recent



end
