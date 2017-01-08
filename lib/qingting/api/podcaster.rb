require 'qingting/api/base'

module Qingting
  module Api
    module Podcaster
      # extend self

      def self.included(base)
        base.send :extend, ClassMethods
      end

      # Class methods
      module ClassMethods

        def podcasters_guides
          url = eval("Base.v6_podcasters_guides")
          Base.request(url)
        end

        def podcasters_attributes
          url = eval("Base.v6_podcasters_attributes")
          Base.request(url)
        end

        def podcasters_type(type, page=1)
          url = Base.media_url + "podcasters/type/#{type}/page/#{page} "
          Base.request(url)
        end

        def podcasters_recommends
          url = eval("Base.v6_podcasters_recommends")
          Base.request(url)
        end

        def podcasters_attr(attr_ids, page=1)
          url = Base.media_url + "podcasters/attr/#{attrids}/page/#{page} "
          Base.request(url)
        end

        def podcaster(id)
          url = eval("Base.v6_podcasters_#{id}")
          Base.request(url)
        end

        def podcasters_channelondemands(qingting_id)
          url = eval("Base.v6_podcasters_#{qingting_id}_channelondemands")
          Base.request(url)
        end

        def podcasters_recent(qingting_id)
          url = eval("Base.v6_podcasters_#{qingting_id}_recent")
          Base.request(url)
        end

        def now
          url = eval("Base.v6_now")
          Base.request(url)
        end

        def topic(topic_id)
          url = eval("Base.v6_topic_#{topic_id}")
          Base.request(url)
        end

        def activity(activity_id)
          url = eval("Base.v6_activity_#{activity_id}")
          Base.request(url)
        end
      end
    end
  end
end

