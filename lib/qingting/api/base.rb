module Qingting
	module Api
		module Base
			extend self

			def base_url
				Config::get('base_url')
			end

			def access_url
				base_url + '/access'
			end

			# 1. Base.v6_categories
			# 2. Base.wapi_categories
			# 3. Base.get_client_id
			def method_missing(name, *args)
				if name =~ /^v6_[\w]+/
					name = name.to_s.gsub("v6_", "")
					base_url + '/v6/media/' + name.to_s

				elsif  name =~ /^wapi_[\w]+/
					name = name.to_s.gsub("wapi_", "")
					base_url + '/wapi/' + name.to_s

				elsif  name =~ /^get_[\w]+/
					name = name.to_s.gsub("get_", "")
					Config::get(name)
				end
			end

			def token
				Account.access_token
			end

		end
	end
end

