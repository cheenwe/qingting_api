# Qingting

蜻蜓FM  Ruby API

[API 开发文档](http://open.qingting.fm/documents/API%20%E5%BC%80%E5%8F%91%E6%96%87%E6%A1%A3/)

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
Qingting.configure do |config|
  # config.base_url                    = "http://api.open.qingting.fm"    # api url
  # config.client_id                   = "ZTk4MzAwMzAtYWFiOC0xMWU0LTkyM2YtMDAxNjNlMDAyMGFk"     # 授权 API client_id
  # config.client_secret               = "OTdiNmI0MWEtYzhiZC0zYWE1LWExZmEtMDU0OWZhNTljZmRk"          # 授权 API client_secret
  # config.api_version                 = :v6    # API 的版本,目前有v6
  # config.page_num                    = 1  # 获取信息时, 指定默认的页数
  # config.page_size                   = 30   # 获取信息时, 一页包含信息数量
end
```

## 接口方法

Autho2.0授权
----

| 方法 | API | 接口文档 | 说明 |
| --- | --- | --- | --- |
| QingtingApi::Account.access_token | /access  | [Autho2.0授权](http://open.qingting.fm/documents/documents/Autho2.0授权/) | |

音频数据中心
----

| 方法 | API | 接口文档 | 说明 |
| --- | --- | --- | --- |
| QingtingApi.mediacenterlist | /v6/media/mediacenterlist  | <a href="http://open.qingting.fm/documents/documents/获取音频流拼取规则/">获取域名中心</a> | |


分类(Category)
----

| 方法 | API | 接口文档 | 说明 |
| --- | --- | --- | --- |
| QingtingApi.categories | /v6/media/categories | <a href="http://open.qingting.fm/documents/documents/获取点播所有分类/">获取点播所有分类</a> | |
| QingtingApi.category(id) | /v6/media/categories/5 | <a href="http://open.qingting.fm/documents/documents/直播分类及获取直播属性/">直播分类及获取直播属性</a> | |
| QingtingApi.category(id) | /v6/media/categories/#{category_id} | <a href="http://open.qingting.fm/documents/documents/获取某个分类下的属性/">获取分类属性</a> | |
| QingtingApi.channels(category_id, current_page, page_size) | /v6/media/categories/#{category_id}/channels/order/0/curpage/#{curpage}/pagesize/30 | <a href="http://open.qingting.fm/documents/documents/获取分类下的所有电台或直播电台/">获取分类下的所有电台或直播电台</a> | |
| QingtingApi.channels_attr(category_id, attrs, current_page, page_size)  | /v6/media/categories/#{category_id}/channels/order/0/attr/#{attr_id_1}/#{attr_id_2}/.../curpage/#{curpage}/pagesize/30 | <a href="http://open.qingting.fm/documents/documents/获取分类下的所有电台或直播电台，并按属性筛选/">通过属性筛选分类的点播电台或直播电台</a> | |
| QingtingApi.recommend_guides | /v6/media/recommends/guides/section/#{section_id} | <a href="http://open.qingting.fm/documents/documents/获取点播分类推荐/">点播分类推荐</a> | |
| QingtingApi.live_banner | /v6/media/recommend/live/banner | <a href="http://open.qingting.fm/documents/documents/获取直播banner内容/">直播banner内容</a> | |



点播(OnDemand)
----

| 方法 | API | 接口文档 | 说明 |
| --- | --- | --- | --- |
| QingtingApi.channelondemand(channel_id) | /v6/media/channelondemands/#{channel_id} | <a href="http://open.qingting.fm/documents/documents/获取点播电台/">获取点播电台</a> | |
| QingtingApi.channel(id)| /wapi/channels/#{channel_id} | <a href="http://open.qingting.fm/documents/documents/(新)获取点播电台/">(新)获取点播电台</a> | |
| QingtingApi.wapi_programs(channel_id, curpage, page_size) | /wapi/channelondemands/#{channel_id}/programs/curpage/#{curpage}/pagesize/#{pagesize} | <a href="http://open.qingting.fm/documents/documents/(新)获取点播电台节目单/">(新)获取点播电台节目单</a> | |
| QingtingApi.programs(channel_id, curpage, page_size) | /v6/media/channelondemands/#{channel_id}/programs/curpage/#{curpage}/pagesize/30 | <a href="http://open.qingting.fm/documents/documents/获取点播电台下的点播节目/">获取点播电台下的点播节目</a> | |
| QingtingApi.program(id) | /v6/media/programs/#{programid} | <a href="http://open.qingting.fm/documents/documents/获取点播节目/">获取点播节目</a> | |
| QingtingApi.recommends(channel_id, curpage, page_size) | /v6/media/channelondemands/#{channel_id}/recommends/curpage/#{curpage}/pagesize/#{pagesize} | <a href="http://open.qingting.fm/documents/documents/获取电台推荐列表/">获取电台推荐列表</a> | |


直播(Live)
----

| 方法 | API | 接口文档 | 说明 |
| --- | --- | --- | --- |
| QingtingApi.channellive(id) | /v6/media/channellives/#{channel_id} | <a href="http://open.qingting.fm/documents/documents/获取直播电台/">获取直播电台</a> | |
| QingtingApi.live_channel(id) | /wapi/channels/#{channel_id} | <a href="http://open.qingting.fm/documents/documents/(新)获取直播电台/">(新)获取直播电台</a> | |
| QingtingApi.channellives(channel_id, days)  | /v6/media/channellives/#{channel_id}/programs/day/#{day_1}/#{day_2}/.../ | <a href="http://open.qingting.fm/documents/documents/获取直播电台节目单/">获取直播电台节目单</a> | days: day1,day2,day3,... |
| QingtingApi.nowplaying(day_of_week) | /v6/media/recommends/nowplaying/day/＃{day_of_week} | <a href="http://open.qingting.fm/documents/documents/获取正在直播电台列表/">获取正在直播电台列表</a> | |


临时直播节目(Live)
----

| 方法 | API | 接口文档 | 说明 |
| --- | --- | --- | --- |
| QingtingApi.program(id) | /v6/media/programs/#{programid} | <a href="http://open.qingting.fm/documents/documents/获取临时直播信息/">获取临时直播信息</a> | |

排行榜
----

| 方法 | API | 接口文档 | 说明 |
| --- | --- | --- | --- |
| QingtingApi.billboards_lives | /v6/media/recommends/billboards/channellives | <a href="http://open.qingting.fm/documents/documents/电台排行榜/">电台排行榜</a> | |
| QingtingApi.billboards_ondemands | /v6/media/recommends/billboards/programondemands | <a href="http://open.qingting.fm/documents/documents/点播节目排行榜/">点播节目排行榜</a> | |
| QingtingApi.categories_billboard(category_id) | /wapi/categories/#{category_id}/channels/billboard | <a href="http://open.qingting.fm/documents/documents/分类排行榜/">分类排行榜</a> | |
| QingtingApi.type_billboard(category_id,type) | /v6/media/categories/#{category_id}/channels/billboard/#{type} | <a href="http://open.qingting.fm/documents/documents/获取不同类型的分类排行榜/">获取不同类型的分类排行榜</a> | |

搜索
----

| 方法 | API | 接口文档 | 说明 |
| --- | --- | --- | --- |
| QingtingApi.newsearch(keyword, type) | /newsearch/#{keyword}/type/#{type} | <a href="http://open.qingting.fm/documents/documents/新搜索/">新搜索</a> | |
| QingtingApi.search_hotkeywords | /search/hotkeywords | <a href="http://open.qingting.fm/documents/documents/搜索热词/">搜索热词</a> | |
| QingtingApi.suggest(keyword) | /newsearch/suggest?k=#{keyword} | <a href="http://open.qingting.fm/documents/documents/获取搜索提示/">获取搜索提示</a> | |

获取内容更新状态
----

| 方法 | API | 接口文档 | 说明 |
| --- | --- | --- | --- |
| QingtingApi.categories_recent(start_time, end_time) | /v6/media/categories/recent/starttime/#{starttime}/endtime/#{endtime} | <a href="http://open.qingting.fm/documents/documents/获取点播分类的更新状态/">获取点播分类的更新状态</a> | |
| QingtingApi.channels_recent(category_id, start_time, end_time, current_page=1, page_size=30) | /v6/media/categories/#{category_id}/recent/channels/starttime/#{starttime}/endtime/#{endtime}/curpage/#{curpage}/pagesize/#{pagesize} | <a href="http://open.qingting.fm/documents/documents/查询某个点播分类在指定时间段内所有点播分类的更新状态/">查询某个点播分类在指定时间段内所有点播分类的更新状态</a> | |
| QingtingApi.channelondemands_recent(channelondemand_id, start_time, end_time, current_page=1, page_size=30) | /v6/media/channelondemands/#{channelondemand_id}/recent/starttime/#{starttime}/endtime/#{endtime}/curpage/#{curpage}/pagesize/#{pagesize} | <a href="http://open.qingting.fm/documents/documents/查询某个点播专辑在指定时间段内节目的更新状态/">查询某个点播专辑在指定时间段内节目的更新状态</a> | |
| QingtingApi.live_recent(start_time, end_time, current_page=1, page_size=30) | /v6/media/categories/live/recent/channels/starttime/#{starttime}/endtime/#{endtime}/curpage/#{curpage}/pagesize/#{pagesize} | <a href="http://open.qingting.fm/documents/documents/查询直播电台在指定时间段内的更新状态/">查询直播电台在指定时间段内的更新状态</a> | |

主播
----

| 方法 | API | 接口文档 | 说明 |
| --- | --- | --- | --- |
| QingtingApi.podcaster_guides | /v6/media/podcasters/guides | <a href="http://open.qingting.fm/documents/documents/获取主播推荐页面信息/">获取主播推荐页面信息</a> | |
| QingtingApi.podcasters_attributes | /v6/media/podcasters/attributes | <a href="http://open.qingting.fm/documents/documents/获取主播分类属性/">获取主播分类属性</a> | |
| QingtingApi.podcasters_type(type, page) | /v6/media/podcasters/type/#{type}/page/#{page} | <a href="http://open.qingting.fm/documents/documents/获取主播排行榜或新增主播/">获取主播排行榜或新增主播</a> | |
| QingtingApi.podcasters_recommends | /v6/media/podcasters/attr/#{attrIds}/page/#{page} | <a href="http://open.qingting.fm/documents/documents/获取属性的所有主播/">获取属性的所有主播</a> | |
| QingtingApi.podcasters_attr(attr_ids, page) |  /v6/media/podcasters/recommends | <a href="http://open.qingting.fm/documents/documents/获取推荐的主播/">获取推荐的主播</a> | |
| QingtingApi.podcaster(id) | /v6/media/podcasters/#{qingting_id} | <a href="http://open.qingting.fm/documents/documents/获取主播信息/">获取主播信息</a> | |
| QingtingApi.podcasters_channelondemands(qingting_id) | /v6/media/podcasters/#{qingting_id}/channelondemands | <a href="http://open.qingting.fm/documents/documents/获取主播专辑列表/">获取主播专辑列表</a> | |
| QingtingApi.podcasters_recent(qingting_id) | /v6/media/podcasters/#{qingting_id}/recent | <a href="http://open.qingting.fm/documents/documents/获取主播最近更新节目/">获取主播最近更新节目</a> | |

此刻
----

| 方法 | API | 接口文档 | 说明 |
| --- | --- | --- | --- |
| QingtingApi.now| /v6/media/now | <a href="http://open.qingting.fm/documents/documents/获取此时此刻节目列表/">获取此时此刻节目列表</a> | |

专题
----

| 方法 | API | 接口文档 | 说明 |
| --- | --- | --- | --- |
| QingtingApi.topic(topic_id) | /v6/media/topics/#{topic_id} | <a href="http://open.qingting.fm/documents/documents/获取专题的专辑列表/">获取专题的专辑列表</a> | |

活动
----

| 方法 | API | 接口文档 | 说明 |
| --- | --- | --- | --- |
| QingtingApi.activity(activity_id) | v6/media/activities/#{activity_id} | <a href="http://open.qingting.fm/documents/documents/获取活动信息/">获取活动信息</a> | |



## Change log

| 时间 | 版本 | 接口文档 |
| --- | ---- | ----  |
|2015.12.08  | 0.1.5 | 添加自定义分页参数 |
|2016.12.31  | 0.2.0 | API 接口更新  |
|2017.01.03~01.08 | 0.3.0 | 重构全部接口  |

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/cheenwe/qingting_api. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

