![CI Status](https://www.travis-ci.com/zalazara/Kuru.svg?token=BS4dhxky8jNvHQXewYJD&branch=master)
[![Version](https://img.shields.io/cocoapods/v/Sujdu.svg?style=flat)](https://cocoapods.org/pods/Kuru)
[![License](https://img.shields.io/cocoapods/l/Kuru.svg?style=flat)](https://cocoapods.org/pods/Kuru)
[![Platform](https://img.shields.io/cocoapods/p/Kuru.svg?style=flat)](https://cocoapods.org/pods/Kuru)

![](Documentation/Assets/cover.png)

Kuru is the easy way to manipulating ui data from a server in SwiftUI.

------

Welcome to Kuru - a toolkit for building native, component-driven UIs on iOS. It is designed to enable teams of any size to quickly build, tweak and ship new UI features, in either new or existing apps. It also makes it easy to build backend-driven UIs.



## Documentation

- [Requirements](#requirements)

- [Installation](#installation)

- [Getting started](#getting-started)



## Requirements

- iOS 13+
- Xcode 11+
- Swift 5.1+



## Installation

### CocoaPods

Kuru is available through [CocoaPods](https://cocoapods.org). To install it, simply add the following line to your Podfile:

```ruby
pod 'Kuru', '~> 0.0.3'
```



### Swift Package Manager

The [Swift Package Manager](https://swift.org/package-manager/) is a tool for automating the distribution of Swift code and is integrated into the `swift` compiler. 

Once you have your Swift package set up, adding Kuru as a dependency is as easy as adding it to the `dependencies` value of your `Package.swift`.

```
dependencies: [
    .package(url: "https://github.com/zalazara/Kuru.git", .upToNextMajor(from: "0.0.3"))
]
```



## Getting started

There are also a series of **programming guides** that each introduce you to different aspects of the framework.

- [Component programming guide](https://github.com/zalazara/Kuru/blob/master/Documentation/Component.md)
- [Json programming guide](https://github.com/zalazara/Kuru/blob/master/Documentation/JSON.md)
- [Function programming guide](https://github.com/zalazara/Kuru/blob/master/Documentation/Function.md)



### Basic implementation

```swift
import SwiftUI
import Kuru

struct ContentView: View {
    var body: some View {
         Kuru.render(fromData: jsonData)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
```



## Author

🥷🇦🇷 Alejandro Zalazar, azalazar@outlook.com.ar



## License

Kuru is available under the MIT license. See the LICENSE file for more info.
