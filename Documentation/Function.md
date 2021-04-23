# Function programming guide

Welcome to the Kuru function programming guide! This guide aims to help you gain a deeper understanding of how functions work, how to create them and how you can use them to easily extend the framework with additional functionality.



**Table of contents**

- [Introduction](#introduction)
- [Creating a function](#creating-a-function)
- [Adding support for function in an existing component](#adding-support-for-function-in-an-existing-component)



## Introduction

Kuru framework comes with built-in selection handling for components. The function API also makes it easy to send events back to your content operations from your components.



## Creating a function

Functions are very simple to implement, all you require is one method:

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
            MyFirstView()
        }
    }
}
```



## Adding support for function in an existing component

To integrate your function into a component create a property `KFunctionDecoder` type. 



**Example**



`JsonButtonExampleComponent.swift`

```swift
import SwiftUI
import Kuru

struct JsonButtonExampleComponent: KComponentProtocol {
  
    var text: String
    var action: KFunctionDecoder //KFunctionDecoder is a json function decoder
    
    func render(withChildrens: [AnyView]) -> AnyView {
        Button(text, action: { 
          //Call action
          action() 
        }).toAnyView()
    }
}
```



`server.json`

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

