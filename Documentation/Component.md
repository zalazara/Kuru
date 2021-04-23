# Component programming guide

Welcome to the Kuru component programming guide! This guide aims to help you gain a deeper understanding of how components work, how to build them and how to deal with things like data binding, image loading and layout.



**Table of contents**

- [Introduction](#introduction)
- [The basics](#the-basics)
- [Defining properties for component](#defining-properties-for-component)
- [Rendering a component](#rendering-a-component)
- [Rendering a component with child components](#rendering-a-component-with-child-components)
- [Registering a component to use](#registering-a-component-to-use)



## Introduction

Components are the visual building blocks used to construct a View using the Kuru library.

Each component instance has a 1:1 relationship with its view, and is responsible for rendering a visual representation of a SwiftUI component. A component can also (optionally) have child components nested within it.



## The basics

To start creating a component, create a new class and make it conform to `KComponentProtocol`. 

Initially, the implementation will look something like this:

```swift
import SwiftUI
import Kuru

struct JsonTextComponentExample: KComponentProtocol {
  
    func render(withChildrens: [AnyView]) -> AnyView {

    }
  
}
```



## Defining properties for component

The components property that enables you to set custom keys & values that can be used by your feature & components. This is an essential part of the API as it provides an easy way to extend the models for new ideas & concepts.

Properties must conform to the `Codable` protocol.



```swift
import SwiftUI
import Kuru

struct JsonViewComponentExample: KComponentProtocol {
  	
   	var backgroundColor: Color? // Color+Codable extension is available in Kuru library
  	var width: CGFloat?
  	var height: CGFloat?
  
    func render(withChildrens: [AnyView]) -> AnyView {
      
    }
  
}
```



## Rendering a component

When its time for a component or render a visual representation of a model. The component itself decides what parts of the supplied properties that it wants to use, and how to bind the data contained within the model to any visual building blocks that it uses.

So again a component implementation is very free-form, you just need to add the implementation in the render method.



```swift
import SwiftUI
import Kuru

struct JsonViewComponentExample: KComponentProtocol {
  	
   	var backgroundColor: Color? // Color+Codable extension is available in Kuru library
  	var width: CGFloat?
  	var height: CGFloat?
  
    func render(withChildrens: [AnyView]) -> AnyView {
        var body: some View {
        }
        
        return body
            .background(backgroundColor)
            .toAnyView() // View+ToAnyView extension is available in Kuru library
    }
  
}
```



## Rendering a component with child components

Rendering a component with nested child components is so easy, you only need to add the children components inside itself in the render method.

```swift
import SwiftUI
import Kuru

struct JsonViewComponentExample: KComponentProtocol {
  
    var backgroundColor: Color? // Color+Codable extension is available in Kuru library 
  	var width: CGFloat?
  	var height: CGFloat?
    
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
        
        return content.toAnyView() // View+ToAnyView extension is available in Kuru library
    }
    
    
}
```



## Registering a component to use

It's the time to register a custom component in Kuru library for use this. Registering a component is really easy only you need is call registerComponent or registerComponents method and specified the tag do you want to respond for this component.



```swift
import SwiftUI
import Kuru

@main
struct MyDemoApplication: App {
    
    init() {        
      	// Register component JsonViewComponentExample for type "view" in json data. 
        Kuru.registerComponent(JsonViewComponentExample.self, for: "view")
      
      	// Or register multiple components at the same time
      	Kuru.registerComponents(["view" : JsonViewComponentExample.self ])
    }
    
    var body: some Scene {
        WindowGroup {
            MyFirstView()
        }
    }
}
```

