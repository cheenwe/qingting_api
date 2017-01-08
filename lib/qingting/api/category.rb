require 'qingting/api/base'

module Qingting
  module Api
    module Category
      # extend self

      def self.included(base)
        base.send :extend, ClassMethods
      end

      # Class methods
      module ClassMethods
        def mediacenterlist
          Base.request(Base.v6_mediacenterlist)
        end

        def categories
          Base.request(Base.v6_categories)
        end

        def category(id)
          url = eval("Base.v6_categories_#{id}")
          Base.request(url)
        end

        def channels(category_id, current_page = Base.get_current_page, page_size = Base.get_page_size)
          url = Base.media_url + "categories/#{category_id}/channels/order/0/curpage/#{current_page}/pagesize/#{page_size}"
          Base.request(url)
        end

        def channels_attr(category_id, attrs, current_page = Base.get_current_page, page_size = Base.get_page_size)
          attrs = attrs.gsub(".","/")
          url = Base.media_url + "categories/#{category_id}/channels/order/0/attr/#{attrs}/curpage/#{current_page}/pagesize/#{page_size}"
          Base.request(url)
        end

        def recommend_guides
          url = Base.media_url + "recommend/guides"
          Base.request(url)
        end

        def live_banner
          url = Base.media_url + "recommend/live/banner"
          Base.request(url)
        end

      end
    end
  end
end
