require 'qingting/api/base'

module Qingting
  module Api
    module Ondemand
      # extend self

      def self.included(base)
        base.send :extend, ClassMethods
      end

      # Class methods
      module ClassMethods

        def channelondemand(id)
          url = eval("Base.v6_channelondemands_#{id}")
          Base.request(url)
        end

        def channel(id)
          url = eval("Base.wapi_channels_#{id}")
          Base.request(url)
        end

        def wapi_programs(channel_id, current_page = Base.get_current_page, page_size = Base.get_page_size)
          url = Base.wapi_url + "channelondemands/#{channel_id}/programs/order/0/curpage/#{current_page}/pagesize/#{page_size}"
          Base.request(url)
        end

        def programs(channel_id, current_page = Base.get_current_page, page_size = Base.get_page_size)
          url = Base.media_url + "channelondemands/#{channel_id}/programs/order/0/curpage/#{current_page}/pagesize/#{page_size}"
          Base.request(url)
        end

        def program(id)
          url = eval("Base.v6_programs_#{id}")
          Base.request(url)
        end

        def recommends(channel_id, current_page = Base.get_current_page, page_size = Base.get_page_size)
          url = Base.media_url + "channelondemands/#{channel_id}/recommends/curpage/#{current_page}/pagesize/#{page_size}"
          Base.request(url)
        end

      end
    end
  end
end


