# encoding: utf-8
require 'net/http'
require 'active_support/json'

module QingtingApi
  # Module that manage requests
  module Request
    # Method that use `Net::HTTP.post_form` to perform `POST` action
    #
    def post(api, options = {})
      uri = URI.join(base_url, api)
      res = Net::HTTP.post_form(uri, options)
      result res.body
    end

    # Method that use `Net::HTTP.get` to perform `GET` action
    #
    def get(api, options = {})
      uri = URI.join(base_url, api)
      result Net::HTTP.get(uri, options)
    end

    private

    # Method that parse JSON to Hash
    #
    def result(body)
      begin
        ActiveSupport::JSON.decode body
      rescue => e
        {
          code: 502,
          msg: '内容解析错误',
          detail: e.to_s
        }
      end
    end

    # Base uri for Qingting API
    def base_url
      "#{QingtingApi.config.base_url}/#{QingtingApi.config.api_version}/media"
    end

    module_function :post, :get, :result, :base_url
  end
end
