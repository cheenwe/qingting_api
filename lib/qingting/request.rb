# encoding: utf-8
require 'net/http'
require 'json'

module Qingting
  module Request
    extend self

    def get(url, params: nil, headers: {})
      send_request(:get, url, params: params, headers: headers)
    end

    def post(url, body: {}, params: {}, headers: {})
      send_request(:post, url, params: params, body: body, headers: headers)
    end

    def put(url, body: {}, headers: {})
      send_request(:put, url, body: body, headers: headers)
    end

    def delete(url, params: nil, headers: {})
      send_request(:delete, url, params: params, headers: headers)
    end

    def send_request(method, url, params: nil, body: nil, headers: {}, opts: {})

      # puts ">>>>>>>http start>>>>>>>>>"
      # puts "<method>    #{method}"
      # puts "<url>    #{url}"
      # puts "<params>    #{params}"
      # puts "<body>    #{body}"
      # puts "<headers>    #{headers}"
      # puts "<opts>    #{opts}"
      # puts ">>>>>>>http end>>>>>>>>>"

      raw_response = Qingting::Utils::Http.new(
        method.to_sym,
        url,
        params: params,
        body: body,
        headers: headers,
        opts: opts
      ).send_request

      # puts ">>>>>>>>>>.#{raw_response}"

      parse_body(raw_response.body)
    end

    def parse_body(body)
      JSON.parse(body)
    end

  end
end
