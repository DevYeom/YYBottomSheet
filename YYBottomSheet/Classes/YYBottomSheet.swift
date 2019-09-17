//
//  YYBottomSheet.swift
//  Pods
//
//  Created by DevYeom on 19/05/2019.
//

import UIKit

@available(iOS 10.0, *)
@objcMembers public class YYBottomSheet {

    // MARK: - Enumerations
    public enum Components {
        case bottomUpTable
        case simpleToast
    }

    public enum BottomUpTableOptions {
        case allowTouchOutsideToDismiss
        case backgroundAlpha
        case tableViewHeight
        case tableRowHeight
        case tableViewCellLabelTextColor
        case tableViewSeperatorStyle
        case headerViewBackgroundColor
        case headerViewTitleLabelTextColor
    }

    public enum SimpleToastOptions {
        case showDuration
        case backgroundColor
        case beginningAlpha
        case messageFont
        case messageColor
    }

    // MARK: - Component Varialbes
    public var componentType: Components
    public var bottomUpTable: BottomUpTable?
    public var simpleToast: SimpleToast?

    // MARK: - Initializations
    public init(bottomUpTableTitle title: String, dataArray: Array<String>?, options: Dictionary<YYBottomSheet.BottomUpTableOptions, Any>?, completion selectHandler: @escaping BottomUpTable.SelectHandler) {
        self.componentType = .bottomUpTable
        self.bottomUpTable = BottomUpTable.init(title: title, dataArray: dataArray, completion: selectHandler)

        guard let bottomUpTable = self.bottomUpTable else {
            #if DEBUG
            print("YYBottomSheet Error ::: It can't initialize bottomUpTable. Because keyWindow is nil.")
            #endif
            return
        }

        options?.forEach({ option in
            switch option.key {
            case .allowTouchOutsideToDismiss:
                if let value = option.value as? Bool {
                    bottomUpTable.allowTouchOutsideToDismiss = value
                }
            case .backgroundAlpha:
                if let value = option.value as? Double {
                    bottomUpTable.backgroundAlpha = CGFloat(value)
                } else if let value = option.value as? Int {
                    bottomUpTable.backgroundAlpha = CGFloat(value)
                }
            case .tableViewHeight:
                if let value = option.value as? Int {
                    bottomUpTable.tableViewHeight = CGFloat(value)
                } else if let value = option.value as? Double {
                    bottomUpTable.tableViewHeight = CGFloat(value)
                }
            case .tableRowHeight:
                if let value = option.value as? Int {
                    bottomUpTable.tableRowHeight = CGFloat(value)
                } else if let value = option.value as? Double {
                    bottomUpTable.tableRowHeight = CGFloat(value)
                }
            case .tableViewCellLabelTextColor:
                if let value = option.value as? UIColor {
                    bottomUpTable.tableViewCellLabelTextColor = value
                }
            case .tableViewSeperatorStyle:
                if let value = option.value as? UITableViewCell.SeparatorStyle {
                    bottomUpTable.tableViewSeperatorStyle = value
                }
            case .headerViewBackgroundColor:
                if let value = option.value as? UIColor {
                    bottomUpTable.headerViewBackgroundColor = value
                }
            case .headerViewTitleLabelTextColor:
                if let value = option.value as? UIColor {
                    bottomUpTable.headerViewTitleLabelTextColor = value
                }
            }
        })
    }

    public init(simpleToastMessage message: String, options: Dictionary<YYBottomSheet.SimpleToastOptions, Any>?) {
        self.componentType = .simpleToast
        self.simpleToast = SimpleToast.init(message: message)

        guard let simpleToast = self.simpleToast else {
            #if DEBUG
            print("YYBottomSheet Error ::: It can't initialize simpleToast. Because keyWindow is nil.")
            #endif
            return
        }

        options?.forEach({ option in
            switch option.key {
            case .showDuration:
                if let value = option.value as? Double {
                    simpleToast.showDuration = value
                } else if let value = option.value as? Int {
                    simpleToast.showDuration = Double(value)
                }
            case .backgroundColor:
                if let value = option.value as? UIColor {
                    simpleToast.backColor = value
                }
            case .beginningAlpha:
                if let value = option.value as? Double {
                    simpleToast.beginningAlpha = CGFloat(value)
                } else if let value = option.value as? Int {
                    simpleToast.beginningAlpha = CGFloat(value)
                }
            case .messageFont:
                if let value = option.value as? UIFont {
                    simpleToast.messageFont = value
                }
            case .messageColor:
                if let value = option.value as? UIColor {
                    simpleToast.messageColor = value
                }
            }
        })
    }

    // MARK: - Usage
    public func show() {
        switch self.componentType {
        case .bottomUpTable:
            self.bottomUpTable?.show()
        case .simpleToast:
            self.simpleToast?.show()
        }
    }
}
