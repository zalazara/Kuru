![CI Status](https://www.travis-ci.com/zalazara/Kuru.svg?token=BS4dhxky8jNvHQXewYJD&branch=master)
[![Version](https://img.shields.io/cocoapods/v/Sujdu.svg?style=flat)](https://cocoapods.org/pods/Kuru)
[![License](https://img.shields.io/cocoapods/l/Kuru.svg?style=flat)](https://cocoapods.org/pods/Kuru)
[![Platform](https://img.shields.io/cocoapods/p/Kuru.svg?style=flat)](https://cocoapods.org/pods/Kuru)

![](Documentation/Assets/cover.png)

Kuru is the easy way to manipulating ui data from a server in SwiftUI.

- [Requirements](#requirements)

- [Installation](#installation)

- [Usage](#usage)
  - [Json Format](#json-format)
  
  - [Register component](#register-component)
  - [Using functions](#using-functions)



## Requirements

- iOS 13+
- Xcode 11+
- Swift 5.1+



## Installation

### CocoaPods

Kuru is available through [CocoaPods](https://cocoapods.org). To install it, simply add the following line to your Podfile:

```ruby
pod 'Kuru'
```



## Usage



### Json Format

Kuru library works with the following json contract:



```json
{
  "type" : "your-register-component-type",
  "args" : {
    // Component properties like this
    "text"	: "Hello!"
  },
  "childrens" : [
    // Pass components to render inside
     {
       	"type" : "your-register-component-type",
  			"args" : {
          // Component properties like this
          "text"	: "I'm inside!"
        }
     }
  ]
}
```



### Register component

Registering a component is really easy. All we need a class that implements  JsonComponentProtocol interface.



***JsonViewComponentExample.swift***

```swift
import SwiftUI
import Kuru

struct JsonViewComponentExample: JsonComponentProtocol {
  
    var backgroundColor: Color? // Color+Codable extension is available in Kuru library 
    
    func render(withChildrens: [AnyView]) -> AnyView {
        var body: some View {
            getView(childrens: withChildrens)
        }
        
        return body
            .background(backgroundColor)
            .toAnyView()
    }
    
    
    
    func getView(childrens:  [AnyView]) -> AnyView {
        
        // Render childrens components inside
        let content =
            ForEach(0..<childrens.count) { index in
                childrens[index]
            }
        
        
        if let background = backgroundColor {
            return AnyView(ZStack(content: {
                background.edgesIgnoringSafeArea(.all)
                VStack(content: {
                    content
                })
            }))
        }
        
        return content.toAnyView() // View+ToAnyView extension is available in Kuru library
    }
    
    
}
```



***JsonTextComponentExample.swift***

```swift
import SwiftUI
import Kuru

struct JsonTextComponentExample: JsonComponentProtocol {
   
  	var text: String
    var backgroundColor: Color? // Color+Codable extension is available in Kuru library 
    
    func render(withChildrens: [AnyView]) -> AnyView {
        return generateTextWithProperties()
                .toAnyView() // View+ToAnyView extension is available in Kuru library
    }
    
    private func generateTextWithProperties() -> some View {
        return Text(self.text)
            .background(backgroundColor)
    }
}
```



***MyDemoApplication.swift***

```swift
import SwiftUI
import Kuru

@main
struct MyDemoApplication: App {
    
    init() {        
      	// Register component JsonViewComponentExample for type "view" in json data. 
        Kuru.registerComponent(JsonViewComponentExample.self, for: "view")
      
      	// Or register multiple components at the same time
      	//Kuru.registerComponents(["view" : JsonViewComponentExample.self ])
    }
    
    var body: some Scene {
        WindowGroup {
            MyFirstKuruView()
        }
    }
}
```



### Render

***MyFirstKuruView.swift***

```swift
import SwiftUI
import Kuru

struct MyFirstKuruView: View {
    @State var viewData = Data() // Load json here
    
    var body: some View {
    	Kuru.render(fromData: viewData);
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MyFirstKuruView()
    }
}
```



***server.Json***

```json
{
  "type"	:	"view",
  "args"	:	{
    /// Properties for component
  },
  "children": [
    ...
    {
    	"type" : "text",
      "args" : {
        "text" : "Hello world!",
        "backgroundColor" : "#f00" //Background color is 8 hexadecimal format (hex with alpha)
      }
  	}
    ...
  ]
}
```



## Usings functions

Kuru library supports registering dynamic functions that can be called from json.



## Json contract for function



```json
"action"          :   {
  "name"        :   "your-function-name",
  "parameters"  :   {
    "name"        :   "Alejandro",
    "years"				: 	30
  }
}
```





### Register function

This is an example for register a function 



***MyDemoApplication.swift***

```swift
import SwiftUI
import Kuru

@main
struct MyDemoApplication: App {
    
    init() {        
      	Kuru.registerFunction(name: "sayHello", completion: { params in
            // Params are [String : Any]
            print("Hello \(params?["name"] ?? "" )")
        })
    }
    
    var body: some Scene {
        WindowGroup {
            MyFirstKuruView()
        }
    }
}
```



### Add support for function in my component



***JsonButtonExampleComponent.swift***

```swift
import SwiftUI
import Kuru

struct JsonButtonExampleComponent: JsonComponentProtocol {
  
    var text: String
    var action: KFunctionDecoder //KFunctionDecoder is a json function decoder
    
    func render(withChildrens: [AnyView]) -> AnyView {
        Button(text, action: { action() }).toAnyView()
    }
}
```



### Send function in my server json

```json
{
  "type" : "button",
  "args" : {
    "text"            :  "Press here",
    "action"          :   {
      "name"        :   "sayHello",
      "parameters"  :   {
        "name"        :   "Alejandro"
      }
    }
  }
}
```





## Author

🥷🇦🇷 Alejandro Zalazar, azalazar@outlook.com.ar



## License

Kuru is available under the MIT license. See the LICENSE file for more info.
