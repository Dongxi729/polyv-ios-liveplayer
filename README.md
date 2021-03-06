# polyv-ios-liveplayer

  参考文档：[Wiki](https://github.com/easefun/polyv-ios-liveplayer/wiki)

## 最近更新

- 新增暖场播放逻辑
- 添加自定义设置后台统计参数
- 直播接口更新（PolyvIJKPlayer、PolyvLiveAPI库升级）
- 修复使用中文键盘时自动补正功能导致输入框位置错误的问题
- 修复在iPhone 5s iOS 11下，进入观看页当前显示表情键盘时退出可能存在的问题

## 最新版本

[Release](https://github.com/easefun/polyv-ios-liveplayer/releases)

完整运行项目：[v2.3.0](http://repo.polyv.net/ios/download/livesdk-demo/liveplayer_2.3.0+180320.zip)

#### Podfile：

```ruby
platform :ios, "8.0"
use_frameworks!

target 'IJKLivePlayer' do
  pod 'PolyvIJKPlayer', '~> 0.1.0'    # Polyv ijkPlayer.
  pod 'PolyvLiveAPI', '~> 0.3.0'      # Polyv live api.
  pod 'PolyvSocketAPI', '~> 0.3.0'    # Polyv socket.io api.
end
```

## Features

- 直播播放
- 暖场播放（视频/图片）
- 竖屏小屏/横屏全屏
- 弹幕
- 聊天室
- 咨询提问
- 在线列表
