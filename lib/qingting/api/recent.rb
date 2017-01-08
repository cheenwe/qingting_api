require 'qingting/api/base'

module Qingting
  module Api
    module Recent
      # extend self

      def self.included(base)
        base.send :extend, ClassMethods
      end

      # Class methods
      module ClassMethods

        def categories_recent(start_time, end_time)
          url = Base.media_url + "categories/recent/starttime/#{start_time}/endtime/#{end_time}"
          Base.request(url)
        end

        def channels_recent(category_id, start_time, end_time, current_page = Base.get_current_page, page_size = Base.get_page_size)
          url = Base.media_url + "categories/#{category_id}/recent/channels/starttime/#{start_time}/endtime/#{end_time}/curpage/#{current_page}/pagesize/#{page_size}"
          Base.request(url)
        end

        def channelondemands_recent(channelondemand_id, start_time, end_time, current_page = Base.get_current_page, page_size = Base.get_page_size)
          url = Base.media_url + "categories/#{channelondemand_id}/recent/channelondemands/starttime/#{start_time}/endtime/#{end_time}/curpage/#{current_page}/pagesize/#{page_size}"
          Base.request(url)
        end


        def live_recent(start_time, end_time, current_page = Base.get_current_page, page_size = Base.get_page_size)
          url = Base.media_url + "categories/live/recent/channels/starttime/#{start_time}/endtime/#{end_time}/curpage/#{current_page}/pagesize/#{page_size}"
          Base.request(url)
        end

        def newsearch(keyword, type)
          url = Base.base_url + "newsearch/#{keyword}/type/#{type}"
          Base.request(url)
        end

        def search_hotkeywords
          url = Base.base_url + "search/hotkeywords"
          Base.request(url)
        end

        def suggest(keyword)
          url = Base.base_url + "/newsearch/suggest?k=#{keyword}"
          Base.request(url)
        end

      end
    end
  end
end


