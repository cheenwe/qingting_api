# QingtingApi

蜻蜓FM,接口
http://open.qingting.fm/documents/API%20%E5%BC%80%E5%8F%91%E6%96%87%E6%A1%A3/

## 安装  

在您的 `Gemfile` 里面添加:

```
gem 'qingting_api'
```

然后, 在 console 中执行下面的代码:

``` bash
# 安装gem
bundle
 
rails g qingting_api:config  # 将会拷贝配置文件至 `config/initializers/qingting_api.rb`
```

## 配置

``` ruby
SmartSMS.configure do |config|

    # config.base_url                     = "http://api.open.qingting.fm"    # api url
    # config.client_id                     = "ZTk4MzAwMzAtYWFiOC0xMWU0LTkyM2YtMDAxNjNlMDAyMGFk"     # 授权 API client_id
    # config.client_secret                     = "OTdiNmI0MWEtYzhiZC0zYWE1LWExZmEtMDU0OWZhNTljZmRk"          # 授权 API client_secret
    # config.api_version                 = :v6    # API 的版本,目前有v6
    # config.page_num                    = 1  # 获取信息时, 指定默认的页数
    # config.page_size                   = 20   # 获取信息时, 一页包含信息数量
    # config.company                     = 'Cheenwe'    # 申请api公司名称
    # config.expires_in                  = 7200.second    # 过期时间。当access_token过期时，API会返回token_expired错误。这时需要重新申请access token
end
```

## 接口方法

#### 音频数据中心
> |方法|API|说明
|:-----  |:-------|-----                               |
|QingtingApi.mediacenterlist  |
 /v6/media/mediacenterlist  | 获取域名中心

#### 分类(Category)

> |方法|API|说明
|:-----  |:-------|-----                               |
|QingtingApi.categories  |
 /v6/media/categories  |  获取点播所有分类
|QingtingApi.get("categories/5") /QingtingApi.get_id("categories",5)  |
 /v6/media/categories/5  |直播分类及获取直播属性
|QingtingApi.get("categories/5") /QingtingApi.get_id("categories",5)   |
 /v6/media/categories/#{category_id} |获取分类属性
|QingtingApi.catrgory_channel(category_id, curpage)    |
 /v6/media/categories/#{category_id}/channels/order/0/curpage/#{curpage}/pagesize/30 |获取分类下的所有电台或直播电台
 
#### 点播(OnDemand)

> |方法|API|说明
|:-----  |:-------|-----                               |
|QingtingApi.get("channelondemands/35242") / QingtingApi.get_id("channelondemands",35242) |
 /v6/media/channelondemands/#{channel_id}  |  获取点播电台
|QingtingApi.ondemand_channel(35242,1)  |
 /v6/media/channelondemands/#{channel_id}/programs/curpage/#{curpage}/pagesize/30  |  获取点播电台下的点播节目
|QingtingApi.get("programs/3568700") / QingtingApi.get_id("programs",3568700)   |
 /v6/media/programs/#{programid}| 获取点播节目

#### 直播(Live)

> |方法|API|说明
|:-----  |:-------|-----                               |
|QingtingApi.get("channellives/266") / QingtingApi.get_id("channellives",266) |
 /v6/media/channellives/#{channel_id} |   获取直播电台
|QingtingApi.live_channel(266,4)  |
 /v6/media/channellives/#{channel_id}/programs/day/#{day_1}/#{day_2}/.../ |   获取直播电台节目单
#### 排行榜

> |方法|API|说明
|:-----  |:-------|-----                               |
|QingtingApi.get("recommends/billboards/channellives") |
 /v6/media/recommends/billboards/channellives   | 电台排行榜
|QingtingApi.get("recommends/billboards/programondemands")  |
 /v6/media/recommends/billboards/programondemands |   点播节目排行榜

#### 搜索
> |方法|API|说明
|:-----  |:-------|-----                               |
|QingtingApi.search("上海") /QingtingApi.search("上海","channel_ondemand") |  /search/#{keyword}/type/#{type}| 搜索 
 
## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/cheenwe/qingting_api. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

