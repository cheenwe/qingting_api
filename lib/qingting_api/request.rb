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
      puts ">>>>>>>>>>>>>in get "
      url = URI.join(base_url, api)

      puts "---------------->>#{url} ----------------------"

      result Net::HTTP.get(url)


      # uri = URI('http://example.com/index.html')
      # params = { :limit => 10, :page => 3 }
      # uri.query = URI.encode_www_form(params)

      # res = Net::HTTP.get_response(uri)



      # uri = URI.parse @url
      # http = Net::HTTP.new(uri.host, uri.port)
      # request = Net::HTTP::Get.new(uri, options)
      # # # http.use_ssl = true
      # http.request(request)
    end

    private

    # def url
    #   # http://api.open.qingting.fm/v6/media/mediacenterlist?access_token=ZTQwMWMyMzctYTFmMi00ZjczLTljOWYtM2Y2YmQ0NzZhODUz
    #   @url = "#{QingtingApi.config.base_url}/v6/media/#{}/&from=#{@options[:from]}&to=#{@options[:to]}"
    # rescue
    #   puts "参数错误!"
    # end

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
      "#{QingtingApi.config.base_url}"
    end

    module_function :post, :get, :result, :base_url
  end
end
