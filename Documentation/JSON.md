# JSON Programming Guide

Welcome to the Kuru JSON programming guide! This guide aims to act as a reference to the default JSON schema provided by the framework, and also contain information on how to enable a custom JSON schema to be used with the framework.



**Table of contents**

- [Introduction](#introduction)
- [JSON schema](#json-schema)
- [JSON function schema](#json-function-schema)



## Introduction

Kuru library enables content for views to be defined through JSON. This can make it a lot faster to ship content changes, since content can be defined completely in a server-side system, without requiring a client release.



## JSON schema

Here is a reference for the  JSON schema:



| **Key**   | Type   | Description                                                  |
| --------- | ------ | ------------------------------------------------------------ |
| type      | String | Specific the type of register component to use to render. Example : "type" : "view" |
| args      | [ ]    | Dictionary of properties for the component. Example [ "backgroundColor" : "#fff"] |
| childrens | [ ]    | Dictionary of components to render as nested children's      |

**Example**

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



## JSON function schema

Kuru library support execute registered functions from server. Here is a reference for the function schema:



| Key        | Type   | Description                                                  |
| ---------- | ------ | ------------------------------------------------------------ |
| name       | String | Name of registering function to call                         |
| parameters | [ ]    | Parameters that registered function needed to success execution |



**Example**

```json
{
  "type" : "your-register-component-type",
  "args" : {
    "action"          :   {
      "name"        :   "your-function-name",
      "parameters"  :   {
        "name"        :   "Alejandro",
        "years"				: 	30
      }
    }
  },
  "childrens" : []
}


```

