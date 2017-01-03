# encoding: utf-8

module Qingting

  class Config
    # curl  -X POST "http://api.open.qingting.fm/access?&grant_type=client_credentials" -d "client_id=ZTk4MzAwMzAtYWFiOC0xMWU0LTkyM2YtMDAxNjNlMDAyMGFk&client_secret=OTdiNmI0MWEtYzhiZC0zYWE1LWExZmEtMDU0OWZhNTljZmRk"

    # client_id和client_secret，用以后续获取access_token

    @props = {
        :base_url                    => "http://api.open.qingting.fm",
        :client_id                   => "ZTk4MzAwMzAtYWFiOC0xMWU0LTkyM2YtMDAxNjNlMDAyMGFk",
        :client_secret               => "OTdiNmI0MWEtYzhiZC0zYWE1LWExZmEtMDU0OWZhNTljZmRk",
        :grant_type                  => "client_credentials",
        :api_version                 => :v6,
        :page_num                    => 1,
        :page_size                   => 30,
        :company                     => 'Cheenwe',
        :expires_in                  => 7200
      }


    class << self
      attr_accessor :props

      def configure
        yield props if block_given?
      end

      # Get a configuration property given a specified location, example usage: Config::get('auth.token_endpoint')
      # @param [String] index - location of the property to obtain
      # @return [String]
      def get(index)
        properties = index.split('.')
        get_value(properties, props)
      end

      private

      # Navigate through a config array looking for a particular index
      # @param [Array] index The index sequence we are navigating down
      # @param [Hash, String] value The portion of the config array to process
      # @return [String]
      def get_value(index, value)
        index = index.is_a?(Array) ? index : [index]
        key = index.shift.to_sym
        value.is_a?(Hash) and value[key] and value[key].is_a?(Hash) ?
        get_value(index, value[key]) :
        value[key]
      end
    end
  end

end
