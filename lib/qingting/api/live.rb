require 'qingting/api/base'

module Qingting
  module Api
    module Live
      # extend self

      def self.included(base)
        base.send :extend, ClassMethods
      end

      # Class methods
      module ClassMethods

        def channellive(id)
          url = eval("Base.v6_channellives_#{id}")
          Base.request(url)
        end

        def live_channel(id)
          url = eval("Base.wapi_channels_#{id}")
          Base.request(url)
        end

        def channellives(channel_id, days)
          days = days.gsub(".","/")

          url = Base.media_url + "channellives/#{channel_id}/programs/day/#{days}"
          Base.request(url)
        end


        def nowplaying(day)
          url = Base.media_url + "recommends/nowplaying/day/#{day}"
          Base.request(url)
        end

      end
    end
  end
end

