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

	      def categories
					params = {
							access_token: Base.token
						}
	        result = Utils::Request.get(Base.v6_categories, params: params)
	        result
	      end

	    end

		end
	end
end


# /v6/media/categories  <a href="http://open.qingting.fm/documents/documents/获取点播所有分类/">获取点播所有分类</a>

# /v6/media/categories/5  <a href="http://open.qingting.fm/documents/documents/直播分类及获取直播属性/">直播分类及获取直播属性</a>

# /v6/media/categories/#{category_id}  <a href="http://open.qingting.fm/documents/documents/获取某个分类下的属性/">获取分类属性</a>

# /v6/media/categories/#{category_id}/channels/order/0/curpage/#{curpage}/pagesize/30  <a href="http://open.qingting.fm/documents/documents/获取分类下的所有电台或直播电台/">获取分类下的所有电台或直播电台</a>

# /v6/media/categories/#{category_id}/channels/order/0/attr/#{attr_id_1}/#{attr_id_2}/.../curpage/#{curpage}/pagesize/30  <a href="http://open.qingting.fm/documents/documents/获取分类下的所有电台或直播电台，并按属性筛选/">通过属性筛选分类的点播电台或直播电台</a>

# /v6/media/recommends/guides/section/#{section_id}  <a href="http://open.qingting.fm/documents/documents/获取点播分类推荐/">点播分类推荐</a>

# /v6/media/recommend/live/banner  <a href="http://open.qingting.fm/documents/documents/获取直播banner内容/">直播banner内容</a>
