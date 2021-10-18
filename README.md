# SwiftNetworkLayer

[![CI Status](https://img.shields.io/travis/mengxiangjian13@163.com/SwiftNetworkLayer.svg?style=flat)](https://travis-ci.org/mengxiangjian13@163.com/SwiftNetworkLayer)
[![Version](https://img.shields.io/cocoapods/v/SwiftNetworkLayer.svg?style=flat)](https://cocoapods.org/pods/SwiftNetworkLayer)
[![License](https://img.shields.io/cocoapods/l/SwiftNetworkLayer.svg?style=flat)](https://cocoapods.org/pods/SwiftNetworkLayer)
[![Platform](https://img.shields.io/cocoapods/p/SwiftNetworkLayer.svg?style=flat)](https://cocoapods.org/pods/SwiftNetworkLayer)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

## Installation

SwiftNetworkLayer is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'SwiftNetworkLayer'
```
## What & Why
SwiftNetworkLayer 库是对Alamofire进行的包装，包装的目的有以下几个：

1. 对Alamofire进行功能简化。因为Alamofire对于网络层的包装还是比较全面，但大部分App在开发的过程当中，只使用基本的网络请求部分，更多的部分其实是用不到的。所以本框架从实际业务出发，对基本功能进行封装，其他复杂功能不予暴露，使用起来更简单。
2. 预留公共请求参数、Header的设置。
3. 尽量不暴露Alamofire。

## Author

mengxiangjian13@163.com, mengxiangjian13@163.com

## License

SwiftNetworkLayer is available under the MIT license. See the LICENSE file for more info.
