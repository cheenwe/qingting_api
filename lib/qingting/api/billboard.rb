require 'qingting/api/base'

module Qingting
  module Api
    module Billboard
      # extend self

      def self.included(base)
        base.send :extend, ClassMethods
      end

      # Class methods
      module ClassMethods

        def recommends_billboards_channellives
          url = eval("Base.v6_recommends_billboards_channellives")
          Base.request(url)
        end

        def recommends_billboards_programondemands
          url = eval("Base.v6_recommends_billboards_programondemands")
          Base.request(url)
        end

        def categories_billboard(category_id)
          url = eval("Base.v6_categories_#{category_id}_channels_billboard")
          Base.request(url)
        end

        def type_billboard(category_id,type)
          url = eval("Base.v6_categories_#{category_id}_channels_billboard_#{type}")
          Base.request(url)
        end

      end
    end
  end
end


