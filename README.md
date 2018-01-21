# FadedScrollView

 [![N|Solid](https://img.shields.io/badge/Language-Swift%204.0-orange.svg)](https://nodesource.com/products/nsolid)

Simple way to make a scrollview or scrollview subclases to fade at bottom or top (UITableView/UIScrolView/UITextView...)

![Example](https://media.giphy.com/media/l3diWOgcpVxlA8X84/giphy.gif)

### Installation

Just drag `FadedScrollView.swift` into your project

### Usage

```swift
let fadedScroll = FadedScrollView(frame: self.scrollView.bounds)
fadedScroll.fadeBottom = true
fadedScroll.fadeTop = false
fadedScroll.fadeSize = 45.0
self.scrollView = fadedScroll

// You can apply it to any ScrollView Subclass
self.tableView.scrollView = fadedScroll
self.textView.scrollView = fadedScroll
```

Or you can basically use the interface builder to change the UIScrollView Class and its parameters
### Todos
 - support cocoapods

### License
----

MIT

