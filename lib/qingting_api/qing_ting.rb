module QingtingApi
	# Message service: methods that are used to manage messages
	module QingTing

		def self.included(base)
			base.send :extend, ClassMethods
		end

		# Class methods
		module ClassMethods

			def find_by_cid(cmode, cid)
				Request.get "#{cmode}", cid: cid
			end

			def method_missing(name, *args)
				if name != /^get_(.*)/
					Request.get  "/#{QingtingApi.config.api_version}/media/#{name}?access_token=#{token}"
				else
					{
						code: 404,
						msg: 'NOT FIND'
					}
				end
			end

			def get(name)
				Request.get  "/#{QingtingApi.config.api_version}/media/#{name}?access_token=#{token}"
			end

			def get_id(name, id)
				Request.get  "/#{QingtingApi.config.api_version}/media/#{name}/#{id}?access_token=#{token}"
			end

			def catrgory_channel(category_id, curpage, page_size={})
				if page_size.present?
				Request.get  "/#{QingtingApi.config.api_version}/media/categories/#{category_id}/channels/order/0/curpage/#{curpage}/pagesize/#{page_size}?access_token=#{token}"
				else
				Request.get  "/#{QingtingApi.config.api_version}/media/categories/#{category_id}/channels/order/0/curpage/#{curpage}/pagesize/#{QingtingApi.config.page_size}?access_token=#{token}"
				end
			end

			def ondemand_channel(category_id, curpage, page_size={})
				if page_size.present?
					Request.get  "/#{QingtingApi.config.api_version}/media/channelondemands/#{category_id}/programs/curpage/#{curpage}/pagesize/#{page_size}?access_token=#{token}"
				else
					Request.get  "/#{QingtingApi.config.api_version}/media/channelondemands/#{category_id}/programs/curpage/#{curpage}/pagesize/#{QingtingApi.config.page_size}?access_token=#{token}"
				end
			end

			def live_channel(channel_id, day)
				Request.get  "/#{QingtingApi.config.api_version}/media/channellives/#{channel_id}/programs/day/#{day}?access_token=#{token}"
			end

			def search(keyword, type={})
				if type.present?
					Request.get  "/search/#{CGI.escape(keyword)}/type/#{type}?access_token=#{token}"
				else
					Request.get  "/search/#{CGI.escape(keyword)}/type/all?access_token=#{token}"
				end
			end

			def token
				QingtingApi::Account.access_token
			end

		end

	end
end
