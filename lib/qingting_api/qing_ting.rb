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
				if name
					Request.get  "/#{QingtingApi.config.api_version}/media/#{name}?access_token=#{token}"
				else
					{
					  code: 404,
					  msg: 'NOT FIND'
					}
				end
			end


			def token
				QingtingApi::Account.access_token
			end

		end

	end
end
