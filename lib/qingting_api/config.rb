# encoding: utf-8
require 'active_support/configurable'
require 'active_support/core_ext'

module QingtingApi

  # curl  -X POST "http://api.open.qingting.fm/access?&grant_type=client_credentials" -d "client_id=ZTk4MzAwMzAtYWFiOC0xMWU0LTkyM2YtMDAxNjNlMDAyMGFk&client_secret=OTdiNmI0MWEtYzhiZC0zYWE1LWExZmEtMDU0OWZhNTljZmRk"

  # client_id和client_secret，用以后续获取access_token
  def self.configure(&block)
    yield @config ||= QingtingApi::Configuration.new
  end

  # Global settings for QingtingApi
  def self.config
    @config
  end

  # Configuration class
  #
  class Configuration #:nodoc:
    include ActiveSupport::Configurable
    # client_id和client_secret，用以后续获取access_token
    config_accessor :base_url                     # api url
    config_accessor :client_id                     # 授权 API client_id
    config_accessor :client_secret                     # 授权 API client_secret
    config_accessor :api_version                 # API 的版本,目前有v6
    config_accessor :page_num                    # 获取信息时, 指定默认的页数
    config_accessor :page_size                   # 获取信息时, 一页包含信息数量
    config_accessor :company                     # 默认公司名称
    config_accessor :expires_in                  # 过期时间。当access_token过期时，API会返回token_expired错误。这时需要重新申请access token
  end

  configure do |config|
    config.base_url                     = "http://api.open.qingting.fm"
    config.client_id                     = "ZTk4MzAwMzAtYWFiOC0xMWU0LTkyM2YtMDAxNjNlMDAyMGFk"
    config.client_secret                     = "OTdiNmI0MWEtYzhiZC0zYWE1LWExZmEtMDU0OWZhNTljZmRk"
    config.api_version                 = :v6
    config.page_num                    = 1
    config.page_size                   = 30
    config.company                     = 'Cheenwe'
    config.expires_in                  = 7200.second
  end
end
