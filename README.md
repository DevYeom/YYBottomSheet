# YYBottomSheet

![Swift](https://img.shields.io/badge/Swift-5.0-orange.svg)
[![Version](https://img.shields.io/cocoapods/v/YYBottomSheet.svg?style=flat)](https://cocoapods.org/pods/YYBottomSheet)
[![SwiftPM](https://img.shields.io/badge/SPM-supported-DE5C43.svg?style=flat)](https://swift.org/package-manager/)
[![License](https://img.shields.io/cocoapods/l/YYBottomSheet.svg?style=flat)](https://cocoapods.org/pods/YYBottomSheet)
[![Platform](https://img.shields.io/cocoapods/p/YYBottomSheet.svg?style=flat)](https://cocoapods.org/pods/YYBottomSheet)

## Introduction

When you need to let users choose one of several or know informations by showing bottomSheet, you can use YYBottomSheet. Simple And Clear 😎

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

![](https://raw.githubusercontent.com/DevYeom/YYBottomSheet/master/demo_v1.1.0.gif)

## Usage

To create and show a bottomSheet, first of all, import the module at the beginning of the file:

```swift
import YYBottomSheet
```

First of all, you can show the bottomUpTable as below:

```swift
let bottomUpTable = YYBottomSheet.init(bottomUpTableTitle: title, dataArray: dataArray, options: nil) { cell in
    // whatever you want to code
    // print("\(cell.indexPath.row) : \(cell.titleLabel.text)")
}
bottomSheet.show()
```

And button handler (SelectHandler) is just a lambda:

```swift
(YYBottomSheetCell) -> ()
```

Second, you can show the simpleToast as below:

```swift
let message = "Hello World!"
let simpleToast = YYBottomSheet.init(simpleToastMessage: message, options: nil)

simpleToast.show()
```

You can customize several things by setting options as below:

### BottomUpTableOptions

| option | example |
|---|---|
| allowTouchOutsideToDismiss | false |
| backgroundAlpha |  0.3 |
| tableViewHeight | 200 |
| tableRowHeight | 50 |
| tableViewCellLabelTextColor | UIColor.blue |
| tableViewSeperatorStyle | UITableViewCell.SeparatorStyle.none |
| headerViewBackgroundColor | UIColor.yellow |
| headerViewTitleLabelTextColor | UIColor.red |

### SimpleToastOptions

| option | example |
|---|---|
| showDuration | 2.0 |
| backgroundColor |  UIColor.black |
| beginningAlpha | 0.8 |
| messageFont | UIFont.italicSystemFont(ofSize: 15) |
| messageColor | UIColor.white |

Check full example as below:

```swift
/**
* BottomUpTable
*/
let title = "Fruits"
let dataArray = ["apple", "grape", "watermelon", "banana", "strawberry", "cherry", "pineapple", "pear"]
let options: [YYBottomSheet.BottomUpTableOptions:Any] = [
    .allowTouchOutsideToDismiss: true,
    .backgroundAlpha: 0.5,
    .tableViewHeight: 200,
    .tableRowHeight: 50,
    .tableViewSeperatorStyle: UITableViewCell.SeparatorStyle.none
]

let bottomUpTable = YYBottomSheet.init(bottomUpTableTitle: title, dataArray: dataArray, options: options) { cell in
    self.selectedFruitLabel.text = cell.titleLabel.text
}

bottomUpTable.show()

/**
* SimpleToast
*/
let options: [YYBottomSheet.SimpleToastOptions:Any] = [
    .showDuration: 2.0,
    .backgroundColor: UIColor.black,
    .beginningAlpha: 0.8,
    .messageFont: UIFont.italicSystemFont(ofSize: 15),
    .messageColor: UIColor.white
]

let message = "SimpleToast can be customized!"
let simpleToast = YYBottomSheet.init(simpleToastMessage: message, options: options)

simpleToast.show()
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
