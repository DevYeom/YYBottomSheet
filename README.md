# YYBottomSheet

![Swift](https://img.shields.io/badge/Swift-5.0-orange.svg)
[![Version](https://img.shields.io/cocoapods/v/YYBottomSheet.svg?style=flat)](https://cocoapods.org/pods/YYBottomSheet)
[![License](https://img.shields.io/cocoapods/l/YYBottomSheet.svg?style=flat)](https://cocoapods.org/pods/YYBottomSheet)
[![Platform](https://img.shields.io/cocoapods/p/YYBottomSheet.svg?style=flat)](https://cocoapods.org/pods/YYBottomSheet)

## Introduction

When you need to let user choose one of several, you can use YYBottomSheet. Simple And Clear 😎

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

![](https://raw.githubusercontent.com/DevYeom/YYBottomSheet/master/demo.gif)

## Usage

To create and show a bottomSheet, first of all, import the module at the beginning of the file:

```swift
import YYBottomSheet
```

Then just show the bottomSheet as below:

```swift
let bottomSheet = YYBottomSheet(title: "Fruits", dataArray: ["apple", "grape", "strawberry"]) { (cell) in
    // whatever you want to code
    // print("\(cell.indexPath.row) : \(cell.titleLabel.text)")
}
bottomSheet.show()
```

And button handler (SelectHandler) is just a lambda:

```swift
(YYBottomSheetCell) -> ()
```

You can customize several things as below:

```swift
public var allowTouchOutsideToDismiss: Bool
public var backgroundAlpha: CGFloat

public var tableViewHeight: CGFloat
public var tableRowHeight: CGFloat
public var tableViewCellLabelTextColor: UIColor
public var tableViewSeperatorStyle: UITableViewCell.SeparatorStyle

public var headerViewBackgroundColor: UIColor
public var headerViewTitleLabelTextColor: UIColor
```

Check full example as below:

```swift
let title = "Fruits"
let dataArray = ["apple", "grape", "watermelon", "banana", "strawberry", "cherry", "pineapple", "pear"]

let bottomSheet = YYBottomSheet.init(title: title, dataArray: dataArray) { (cell) in
    // whatever you want to code
    // print("\(cell.indexPath.row) : \(cell.titleLabel.text)")
}

/* Customizable Variables
bottomSheet.allowTouchOutsideToDismiss = false // default: true
bottomSheet.backgroundAlpha = 0.3 // default: 0.5

bottomSheet.tableViewHeight = 100 // default: 250
bottomSheet.tableRowHeight = 30 // default: 45
bottomSheet.tableViewCellLabelTextColor = UIColor.blue
bottomSheet.tableViewSeperatorStyle = .none

bottomSheet.headerViewBackgroundColor = UIColor.yellow
bottomSheet.headerViewTitleLabelTextColor = UIColor.red
*/

bottomSheet.show()
```

## Installation

YYBottomSheet is available through [CocoaPods](https://cocoapods.org/pods/YYBottomSheet). To install
it, simply add the following line to your Podfile:

```ruby
pod 'YYBottomSheet'
```

## Author

DevYeom, dev.yeom@gmail.com

## License

YYBottomSheet is available under the MIT license. See the LICENSE file for more info.
