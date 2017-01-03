# encoding: utf-8
module Qingting
  module Account
    extend self

    # 获取账户 token
    #
    def access_token
      token_hash['access_token']
    end

    def token_hash
      validate_token_hash
      @token_hash ||=
        begin
          @token_request_at = Time.now
          params = {
            grant_type: Config::get('grant_type'),
            client_id: Config::get('client_id'),
            client_secret: Config::get('client_secret')
          }
          url = "#{Config::get('base_url')}/access"
          result = Request.post(url, params: params)
          result
        end
    end

    # Check token expired or not
    def validate_token_hash
      if @token_request_at and
          @token_hash and @token_hash['expires_in'] and
          (Time.now - @token_request_at) > @token_hash['expires_in'].to_i
        @token_hash = nil
      elsif @token_request_at and
          @token_hash and @token_hash['expires_in']
        @token_hash['access_token']
      else
        puts "start get token ..."
      end
    end

  end
end