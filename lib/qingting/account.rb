# encoding: utf-8
module Qingting
  module Account
    extend self

    # 获取账户 token
    #

    def access_token

      validate_token_hash

      @token_hash ||=
        begin
          puts "------ss-----"
          @token_request_at = Time.now

          params = {
            expires_in: 20,
            grant_type: Qingting::Config::get('grant_type'),
            client_id: Qingting::Config::get('client_id'),
            client_secret: Qingting::Config::get('client_secret')
          }

          url = "#{Qingting::Config::get('base_url')}/access"

          result = Request.post(url, params: params)

          result

          # result['expires_in']

          # result['access_token']
        end

    end


      # Check token expired or not
      def validate_token_hash
        if @token_request_at and
            @token_hash and @token_hash[:expires_in] and
            (Time.now - @token_request_at) > @token_hash[:expires_in].to_i
          @token_hash = nil
        else
          puts "=====not release====less #{Time.now.to_i - @token_request_at.to_i}"
          puts @token_hash
        end
      end

  end
end