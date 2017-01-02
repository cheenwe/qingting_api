# encoding: utf-8
module QingtingApi
  module Account
    extend self

    # 获取账户 token
    #
    def access_token
      params = {
        grant_type: "client_credentials",
        client_id: QingtingApi.config.client_id,
        client_secret:QingtingApi.config.client_secret
      }

      result = Request.post(url, params: params)
      result['access_token']
    end

  end
end