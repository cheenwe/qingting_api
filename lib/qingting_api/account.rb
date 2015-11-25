# encoding: utf-8
require 'net/http'
require 'active_support/json'

module QingtingApi
  # Module that handle user information
  #
  module Account
    module_function

    # 获取账户 token
    #
    def access_token
      post 'access', grant_type: "client_credentials", client_id: QingtingApi.config.client_id, client_secret:QingtingApi.config.client_secret
    end


    def post(api, options = {})
      uri = URI.join(QingtingApi.config.base_url, api)
      res = Net::HTTP.post_form(uri, options)
      result res.body
    end


    def result(body)
      begin
       resule =  ActiveSupport::JSON.decode body
       resule['access_token']
      rescue => e
        {
          code: 502,
          msg: '内容解析错误',
          detail: e.to_s
        }
      end
    end
  end
end